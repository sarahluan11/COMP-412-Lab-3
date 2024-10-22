from iloc_ir import Argument, ILOCNode
from parser_1 import parse

class Allocator:
    def __init__(self, k: int, filepath: str):
        self.k = k
        self.filepath = filepath

        with open(filepath, 'r') as file:
            result, _ = parse(file)
        
        # Rename the internal representation
        res = result.rename_registers()

        self.int_rep = result
        self.MAXLIVE = res[1]
        self.vr_count = res[0]
        self.VRToSpillLoc = [-1 for _ in range(self.vr_count + 1)]
        self.VRToPR = [-1] * (self.vr_count + 1)
        self.PRToVR = [-1] * k
        self.PRToNU = [float('inf')] * k
        self.PRStack = list(range(k - 1, -1, -1))
        self.next_spill_location = 32768
        self.spill_reg = k
        self.mark = -1

    def insert_before(self, new_node, existing_node):
        """
        Inserts new_node before existing_node in the linked list.
        """
        if existing_node.prev is not None:
            existing_node.prev.next = new_node
            new_node.prev = existing_node.prev
        new_node.next = existing_node
        existing_node.prev = new_node
        if self.int_rep.head == existing_node:
            self.int_rep.head = new_node

    def get_PR(self, vr, nu):
        """
        Get a physical register (PR) for the given virtual register (VR).
        If there are no free PRs, spill one.
        """
        if len(self.PRStack) > 0:
            pr = self.PRStack.pop()
        else:
            pr = self.spill()
            self.PRStack.pop()
        self.VRToPR[vr] = pr
        self.PRToVR[pr] = vr
        self.PRToNU[pr] = nu
        return pr

    def free_PR(self, pr):
        """
        Free a physical register (PR) and make it available for reuse.
        """
        self.VRToPR[self.PRToVR[pr]] = -1
        self.PRToVR[pr] = -1
        self.PRToNU[pr] = float('inf')
        self.PRStack.append(pr)

    def spill(self, vr):
        """
        Spill the physical register (PR) assigned to a virtual register (VR) with the farthest next use.
        Insert the necessary load and store instructions to spill and free the register.
        """
        # Pick pr with farthest next use
        unmarked_indices = [i for i in range(len(self.PRToNU)) if self.mark != i]

        pr_to_spill = max(unmarked_indices, key=lambda i: self.PRToNU[i])
        vr_to_spill = self.PRToVR[pr_to_spill]

        # Spill nodes to insert
        loadI_spill = ILOCNode(Argument(constant=self.next_spill_location), Argument(), Argument(pr_to_spill), "loadI")
        store_spill = ILOCNode(Argument(pr_to_spill), Argument(), Argument(f"mem{vr_to_spill}"), "store")
        
        # Track spillage
        self.VRToSpillLoc[vr_to_spill] = self.spill_location

        # Insert LOADI and STORE nodes
        self.insert_before(loadI_spill, self.curr_node) 
        self.insert_before(store_spill, self.curr_node) 

        # Free the spilled PR
        self.free_PR(pr_to_spill)

        # Update spill location
        spill_location += 4

        return pr_to_spill

    def restore(self, vr, pr):
        """
        Restore a spilled virtual register (VR) into a physical register (PR).
        Insert the necessary load instructions to restore the spilled value.
        """
        loadI_restore = ILOCNode(Argument(self.VRToSpillLoc[vr]), Argument(), Argument(pr), "loadI")
        load_restore = ILOCNode(Argument(f"mem{vr}"), Argument(), Argument(pr), "load")

        # Insert the LOADI and LOAD instructions before the current node
        self.insert_before(loadI_restore, self.curr_node) 
        self.insert_before(load_restore, self.curr_node) 
    
    def allocate_registers(self, k):
        """
        Allocate physical registers (PR) for the virtual registers (VR) in the instruction stream.
        If the number of registers (k) is less than MAXLIVE, reserve one register for spilling.
        """
        if k < self.MAXLIVE:
            print("// RESERVING A REGISTER: k =", k, ", MAXLIVE =", self.MAXLIVE)
            self.spill_reg = k - 1
            k -= 1

        # Iterate through linked list of instructions
        self.curr_node = self.int_rep.head
        while self.curr_node:
             # Reset the flag for each instruction
            self.mark = -1 

            # Allocate PRs for uses (arg1)
            if self.curr_node.arg1.sr != None:  
                pr = self.VRToPR[self.curr_node.arg1.sr]
                if pr == -1: 
                    self.curr_node.arg1.sr = self.get_PR(self.curr_node.arg1.sr, self.curr_node.arg1.nu)
                    if self.VRToSpillLoc[self.curr_node.arg1.sr] != -1:
                        self.restore(self.curr_node.arg1.sr, pr)
                self.mark = 1
                self.curr_node.arg1.pr = pr
            
            # Allocate PRs for uses (arg 2)
            if self.curr_node.arg2.sr != None:  
                pr = self.VRToPR[self.curr_node.arg2.sr]
                if pr == -1:
                    self.curr_node.arg2.sr = self.get_PR(self.curr_node.arg2.sr, self.curr_node.arg2.nu)
                    if self.VRToSpillLoc[self.curr_node.arg2.sr] != -1:
                        self.restore(self.curr_node.arg2.sr, pr)
                self.mark = 1
                self.curr_node.arg2.sr = pr
            
            # Free PRs if arg1 and arg2 are no longer used (last use)
            if self.curr_node.arg1.nu == float('inf') and self.VRToPR[self.curr_node.arg1.sr] != None:
                self.free_PR(self.curr_node.arg1.sr)
            if self.curr_node.arg2.nu == float('inf') and self.VRToPR[self.curr_node.arg2.sr] != None:
                self.free_PR(self.curr_node.arg2.sr)

            # Allocate PR for arg3 (definition case)
            if self.curr_node.arg3.sr != None:
                pr = self.get_PR(self.curr_node.arg3.sr, self.curr_node.arg3.nu)
                self.mark = 1
                self.curr_node.arg3.sr = pr  
       
            self.curr_node = self.curr_node.next
    
    # def check_mappings(self):
    #     """
    #     Checks the consistency of the allocator's internal mappings.
    #     Raises an exception if any inconsistency is found.
    #     """
    #     # Check VRToPR mapping for consistency
    #     for vr in range(len(self.VRToPR)):
    #         pr = self.VRToPR[vr]
    #         if pr != INVALID:
    #             if self.PRToVR[pr] != vr:
    #                 raise ValueError(f"Inconsistency: VRToPR[{vr}] = {pr}, but PRToVR[{pr}] = {self.PRToVR[pr]}")
    #             if pr in self.PRStack:
    #                 raise ValueError(f"Physical register r{pr} assigned to vr{vr} is in PRStack")
    #             if pr == self.spill_reg:
    #                 raise ValueError(f"Physical register r{pr} assigned to vr{vr} is the reserved spill register")
    #         else:
    #             if vr in self.PRToVR:
    #                 raise ValueError(f"VRToPR[{vr}] = INVALID, but VR is present in PRToVR")

    #     # Check PRToVR mapping for consistency
    #     for pr in range(len(self.PRToVR)):
    #         vr = self.PRToVR[pr]
    #         if vr != INVALID:
    #             if self.VRToPR[vr] != pr:
    #                 raise ValueError(f"Inconsistency: PRToVR[{pr}] = {vr}, but VRToPR[{vr}] = {self.VRToPR[vr]}")
    #             if pr in self.PRStack:
    #                 raise ValueError(f"Physical register r{pr} assigned to vr{vr} is in PRStack")
    #             if pr == self.spill_reg:
    #                 raise ValueError(f"Physical register r{pr} assigned to vr{vr} is the reserved spill register")
    #         else:
    #             if pr not in self.PRStack and pr != self.spill_reg:
    #                 raise ValueError(f"Physical register r{pr} is not mapped or in PRStack or reserved as spill register")

    #     # Check PRStack for correctness
    #     for pr in self.PRStack:
    #         if self.PRToVR[pr] != INVALID:
    #             raise ValueError(f"Physical register r{pr} in PRStack is mapped to vr{self.PRToVR[pr]}")

    #     # Check that no VR is assigned to the spill register
    #     for vr in range(len(self.VRToPR)):
    #         if self.VRToPR[vr] == self.spill_reg:
    #             raise ValueError(f"Virtual register vr{vr} is assigned to the spill register r{self.spill_reg}")