from iloc_ir import Argument, ILOCNode, ILOCLinkedList
from parser_1 import parse, find_use_defs

class Allocator:
    def __init__(self, k: int, ir: ILOCLinkedList):
        self.k = k
        
        # Rename the internal representation
        res = ir.rename_registers()

        self.int_rep = ir
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
        # comment

        if k < self.MAXLIVE:
            print("// RESERVING A REGISTER: k =", k, ", MAXLIVE =", self.MAXLIVE)
            self.spill_reg = k - 1
            self.PRStack.remove(self.spill_reg)
        else:
            self.spill_reg = None
        
            
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

    def get_PR(self, vr, nu, op):
        """
        Get a physical register (PR) for the given virtual register (VR).
        If there are no free PRs, spill one.
        """
        if len(self.PRStack) > 0:
            pr = self.PRStack.pop()
        else:
            pr = self.choose_spill_pr()

            if pr == -1:
                raise Exception("No physical registers were available to spill")
            
            self.spill(pr, op)

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

    def choose_spill_pr(self):
        """
        Chooses the PR to spill by finding the PR with the farthest next use. 
        """
        # set to -inf
        max_next_use = -float('inf')  
        # set an invalid index
        pr_to_spill = -1  

        for i in range(len(self.PRToNU)):
            if self.PRToNU[i] > max_next_use and i != self.spill_reg and i != self.mark:
                max_next_use = self.PRToNU[i]
                pr_to_spill = i
        
        return pr_to_spill

    def spill(self, pr: int, curr_node: ILOCNode):
        """
        Spill the physical register (PR) assigned to a virtual register (VR) with the farthest next use.
        Insert the necessary load and store instructions to spill and free the register.
        """
        #print("Inserting spill code")
        vr_to_spill = self.PRToVR[pr]

        if vr_to_spill == -1:
            print(f"ERROR: Attempting to spill a PR that does not have a corresponding VR")
            return
        
        if self.VRToSpillLoc[vr_to_spill] == -1:
            self.VRToSpillLoc[vr_to_spill] = self.next_spill_location
            self.next_spill_location += 4

        spill_loc = self.VRToSpillLoc[vr_to_spill]

        # Spill nodes to insert
        loadI_spill = ILOCNode(arg1=Argument(sr=spill_loc), arg2=Argument(), arg3=Argument(pr=self.spill_reg), opcode="loadI")
        store_spill = ILOCNode(arg1=Argument(vr=vr_to_spill, pr=pr), arg2=Argument(), arg3=Argument(pr=self.spill_reg), opcode="store")

        # Insert LOADI and STORE nodes
        self.insert_before(loadI_spill, curr_node) 
        self.insert_before(store_spill, curr_node) 

        # Update the maps to show that pr is now free
        self.VRToPR[vr_to_spill] = -1
        self.PRToVR[pr] = -1
        self.PRToNU[pr] = float('inf')

    def restore(self, vr: int, pr: int, curr_node: ILOCNode):
        """
        Restore a spilled virtual register (VR) into a physical register (PR).
        Insert the necessary load instructions to restore the spilled value.
        """
        #print("inserting restore code")
        vr_spill_loc = self.VRToSpillLoc[vr]

        if vr_spill_loc == -1:
            print(f"ERROR: This vr does not have a corresponding spill location. It must have been spilled.")
            return 
        
        loadI_restore = ILOCNode(arg1=Argument(sr=vr_spill_loc), arg2=Argument(), arg3=Argument(pr=self.spill_reg), opcode="loadI")
        load_restore = ILOCNode(arg1=Argument(pr=self.spill_reg), arg2=Argument(), arg3=Argument(vr=vr, pr=pr), opcode="load")

        # Insert the LOADI and LOAD instructions before the current node
        self.insert_before(loadI_restore, curr_node) 
        self.insert_before(load_restore, curr_node) 
    
    def allocate_registers(self):
        """
        Allocate physical registers (PR) for the virtual registers (VR) in the instruction stream.
        If the number of registers (k) is less than MAXLIVE, reserve one register for spilling.
        """

        # Iterate through linked list of instructions
        curr_node = self.int_rep.head
        while curr_node:
             # Reset the flag for each instruction
            self.mark = -1 
            uses, defs = find_use_defs(curr_node)

            for idx in range(len(uses)):
                use = uses[idx]
                if use.vr is not None:
                    pr = self.VRToPR[use.vr]
                    if pr == -1:
                        use.pr = self.get_PR(use.vr, use.nu, curr_node)
                        self.restore(use.vr, use.pr, curr_node)
                    else:
                        use.pr = pr
                        self.PRToNU[use.pr] = use.nu

                    if idx == 0:
                        self.mark = use.pr
            
            for use in uses:
                if use.vr is not None:      
                    # Free PRs if arg1 and arg2 are no longer used (last use)
                    if use.nu == float('inf') and self.PRToVR[use.pr] != -1:
                        self.free_PR(use.pr)
            
            for d in defs:
                d.pr = self.get_PR(d.vr, d.nu, curr_node)

            #self.check_mappings()

            self.mark = -1
            curr_node = curr_node.next
    
    def check_mappings(self):
        """
        Checks the consistency of the allocator's internal mappings.
        Raises an exception if any inconsistency is found.
        """
        # Check VRToPR mapping for consistency
        for vr in range(len(self.VRToPR)):
            pr = self.VRToPR[vr]
            if pr != -1:
                if self.PRToVR[pr] != vr:
                    raise ValueError(f"Inconsistency: VRToPR[{vr}] = {pr}, but PRToVR[{pr}] = {self.PRToVR[pr]}")
                if pr in self.PRStack:
                    raise ValueError(f"Physical register r{pr} assigned to vr{vr} is in PRStack")
                if pr == self.spill_reg:
                    raise ValueError(f"Physical register r{pr} assigned to vr{vr} is the reserved spill register")
            else:
                if vr in self.PRToVR:
                    raise ValueError(f"VRToPR[{vr}] = INVALID, but VR is present in PRToVR")

        # Check PRToVR mapping for consistency
        for pr in range(len(self.PRToVR)):
            vr = self.PRToVR[pr]
            if vr != -1:
                if self.VRToPR[vr] != pr:
                    raise ValueError(f"Inconsistency: PRToVR[{pr}] = {vr}, but VRToPR[{vr}] = {self.VRToPR[vr]}")
                if pr in self.PRStack:
                    raise ValueError(f"Physical register r{pr} assigned to vr{vr} is in PRStack")
                if pr == self.spill_reg:
                    raise ValueError(f"Physical register r{pr} assigned to vr{vr} is the reserved spill register")
            else:
                if pr not in self.PRStack and pr != self.spill_reg:
                    raise ValueError(f"Physical register r{pr} is not mapped or in PRStack or reserved as spill register")

        # Check PRStack for correctness
        for pr in self.PRStack:
            if self.PRToVR[pr] != -1:
                raise ValueError(f"Physical register r{pr} in PRStack is mapped to vr{self.PRToVR[pr]}")

        # Check that no VR is assigned to the spill register
        for vr in range(len(self.VRToPR)):
            if self.VRToPR[vr] == self.spill_reg:
                raise ValueError(f"Virtual register vr{vr} is assigned to the spill register r{self.spill_reg}")