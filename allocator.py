from iloc_ir import ILOCNode
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
        if existing_node.prev is not None:
            existing_node.prev.next = new_node
            new_node.prev = existing_node.prev
        new_node.next = existing_node
        existing_node.prev = new_node
        if self.head == existing_node:
            self.head = new_node

    def get_PR(self, vr, nu):
        if len(self.PR_stack) > 0:
            pr = self.PR_stack.pop()
        else:
            pr = self.spill()
            self.PR_stack.pop()
        self.VRtoPR[vr] = pr
        self.PRtoVR[pr] = vr
        self.PRNU[pr] = nu
        return pr

    def free_PR(self, pr):
        self.VRtoPR[self.PRtoVR[pr]] = None
        self.PRtoVR[pr] = None
        self.PRNU[pr] = float('inf')
        self.PR_stack.append(pr)

    def spill(self):
        # Pick pr with farthest next use
        unmarked_indices = [i for i in range(len(self.PRNU)) if i not in self.mark]

        pr_to_spill = max(unmarked_indices, key=lambda i: self.PRNU[i])
        vr_to_spill = self.PRtoVR[pr_to_spill]

        # Spill nodes to insert
        loadI_spill = ILOCNode("loadI", operand1=spill_location, operand3=pr_to_spill) 
        store_spill = ILOCNode("store", operand1=pr_to_spill, operand3=f"mem{vr_to_spill}") 
        
        # Track spillage
        self.VRtoSpillLoc[vr_to_spill] = spill_location

        # Insert LOADI and STORE nodes
        self.insert_before(loadI_spill, self.curr_node) 
        self.insert_before(store_spill, self.curr_node) 

        # Free the spilled PR
        self.free_PR(pr_to_spill)

        # Update spill location
        spill_location += 4

        return pr_to_spill

    def restore(self, vr, pr):
        loadI_restore = ILOCNode("loadI", operand1=self.VRtoSpillLoc[vr], operand3=pr)
        load_restore = ILOCNode("load", operand1=f"mem{vr}", operand3=pr) 

        self.insert_before(loadI_restore, self.curr_node) 
        self.insert_before(load_restore, self.curr_node) 
    
    def allocate_registers(self, k):
        if k < self.MAXLIVE:
            print("// RESERVING A REGISTER: k =", k, ", MAXLIVE =", self.MAXLIVE)
            self.spill_reg = k - 1
            k -= 1

        # Iterate through linked list
        curr_node = self.head
        while curr_node:
            for mark in range(len(mark)):
                mark[mark] = 0

            # Allocate PRs for uses (operand 1)
            if curr_node.operand1 != None:  
                # print("inside use for op1")
                pr = self.VRtoPR[curr_node.operand1]
                # VR doesn't have a PR, allocate one
                if pr == None:
                    curr_node.operand1 = self.get_PR(curr_node.operand1, curr_node.nu1)
                    if self.VRtoSpillLoc[curr_node.operand1] != None:
                        self.restore(curr_node.operand1, pr)
                # Mark PR as used
                self.mark[pr] = 1
                # Update operand to point to PR
                curr_node.operand1 = pr
            
            # Allocate PRs for uses (operand 2)
            if curr_node.operand2 != None:  
                # print("inside use for op2")
                pr = self.VRtoPR[curr_node.operand2]
                # VR doesn't have a PR, allocate one
                if pr == None:
                    curr_node.operand1 = self.get_PR(curr_node.operand2, curr_node.nu2)
                    if self.VRtoSpillLoc[curr_node.operand2] != None:
                        self.estore(curr_node.operand2, pr)
                # Mark PR as used
                self.mark[pr] = 1
                # Update operand to point to PR
                curr_node.operand2 = pr
            
            # Free PRs if operand1 or operand2 are no longer used (last use)
            if curr_node.nu1 == float('inf') and self.VRtoPR[curr_node.operand1] != None:
                self.free_PR(curr_node.operand1)
            if curr_node.nu2 == float('inf') and self.VRtoPR[curr_node.operand2] != None:
                self.free_PR(curr_node.operand2)

            # Allocate PR for operand3 (definition case)
            if curr_node.operand3 != None:
                pr = self.get_PR(curr_node.operand3, curr_node.nu3)
                # Mark PR as used
                self.mark[pr] = 1
                # Update operand to point to PR
                curr_node.operand3 = pr  
       
            curr_node = curr_node.next