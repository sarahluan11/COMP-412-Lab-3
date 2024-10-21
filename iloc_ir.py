MAXLIVE = 0
spill_location = 32768

class Argument:
    def __init__(self, sr = None, pr = None, vr = None, nu = None):
        if sr is not None:
            self.sr = int(sr)
        else:
            self.sr = None
        
        if pr is not None:
            self.pr = int(pr)
        else:
            self.pr = None
        
        if vr is not None:
            self.vr = int(vr)
        else:
            self.vr = None 
        
        if nu is not None:
            self.nu = int(nu)
        else:
            self.nu = None
        

class ILOCNode:
    def __init__(self, arg1: Argument, arg2: Argument, arg3: Argument, opcode: str):
        self.arg1 = arg1
        self.arg2 = arg2
        self.arg3 = arg3
        self.prev = None
        self.next = None
        self.opcode = opcode

    def format_operand(self, operand):
        """
        Formats an operand for display. Registers are displayed normally, constants are displayed as 'val'.
        
        Inputs:
        - operand: The operand to format (register or constant).
        
        Outputs:
        - A string representing the formatted operand.
        """
        if operand is None:
            # Empty operand slot
            return "[ ]" 
        if isinstance(operand, int) or operand.isdigit():  
            # Format for constant value
            return f"[ val {operand} ]"
        # Format for register
        return f"[ s{operand} ]"  

    def __str__(self):
        """
        String representation of the ILOCNode, which is printed when the node is displayed.
        
        Outputs:
        - A string showing the opcode and its operands formatted nicely.
        """
        return f"{self.opcode.ljust(8)}{self.format_operand(self.arg1.sr)}, {self.format_operand(self.arg2.sr)}, {self.format_operand(self.arg3.sr)}"
    
    def max_sr(self):
        args = [self.arg1, self.arg2, self.arg3]

        if self.opcode == "nop":
            return 0

        elif self.opcode == "loadI":
            return args[2].sr 

        else:
            max_source_reg = 0
            for arg in args:
                if arg.sr is not None:
                    max_source_reg = max(arg.sr, max_source_reg)
            
            return max_source_reg


class ILOCLinkedList:
    """
    A doubly linked list to store a sequence of ILOC instructions.
    
    Attributes:
    - head: The first node in the linked list.
    - tail: The last node in the linked list.
    """
    def __init__(self):
        """
        Initializes an empty ILOCLinkedList with no head or tail.
        """
        self.head = None
        self.tail = None

    def add_instruction(self, node: ILOCNode):
        if self.tail is None:
            self.head = self.tail = node
        else:
            self.tail.next = node 
            node.prev = self.tail 
            self.tail = node

    def print_instructions(self):
        """
        Prints all ILOC instructions in the linked list.
        Traverses the list from head to tail and prints each node.
        """
        current = self.head
        while current is not None:
            # Print the string representation of the current node
            print(current) 
            # Move to the next node in the list
            current = current.next
    
    def rename_registers(self):
        global max_reg, MAXLIVE
        max_reg = self.max_sr() * 2

        # Virtual register naming starts from -1
        global max_vr
        max_vr = -1

        # Mapping from source register to virtual register
        sr_to_vr = [None] * (max_reg + 1) 
        # Last-use array
        lu = [float('inf')] * (max_reg + 1)

        LIVE = set()

        # Step 1: Traverse the linked list to collect instructions
        instructions = []
        curr_node = self.head

        idx = 0
        while curr_node:
            instructions.append(curr_node)
            curr_node.line_number = idx
            idx += 1
            curr_node = curr_node.next

        idx = len(instructions) - 1

        # Step 2: Process each instruction from last to first
        while idx >= 0:
            curr_instr = instructions[idx]
            
            # Extract source registers
            sr1 = curr_instr.arg1.sr
            sr2 = curr_instr.arg2.sr
            sr3 = curr_instr.arg3.sr

            # Definition cases
            if sr3 != None and curr_instr.opcode != "store":
                if sr_to_vr[sr3] == None:
                    max_vr += 1
                    sr_to_vr[sr3] = max_vr
                # LIVE.remove(sr3)
                curr_instr.arg3.vr = sr_to_vr[sr3]
                curr_instr.arg3.nu = lu[sr3]
                sr_to_vr[sr3] = None
                lu[sr3] = float('inf')

            # Use cases
            if sr1 != None and curr_instr.opcode != "loadI" and curr_instr.opcode != "output":
                LIVE.add(sr1)
                if sr_to_vr[sr1] == None:
                    max_vr += 1
                    sr_to_vr[sr1] = max_vr
                curr_instr.arg1.sr = sr_to_vr[sr1]
                curr_instr.arg1.nu = lu[sr1]

            if sr2 != None:
                LIVE.add(sr2)
                if sr_to_vr[sr2] == None:
                    max_vr += 1
                    sr_to_vr[sr2] = max_vr
                curr_instr.arg2.sr = sr_to_vr[sr2]
                curr_instr.arg2.nu = lu[sr2]

            # Operand 3 for store is always a use case
            if sr3 != None and curr_instr.opcode == "store":
                LIVE.add(sr3)
                if sr_to_vr[sr3] == None:
                    max_vr += 1
                    sr_to_vr[sr3] = max_vr
                curr_instr.arg3.sr = sr_to_vr[sr3]
                curr_instr.arg3.nu = lu[sr3]
            
            if sr1 != None:
                lu[sr1] = idx

            if sr2 != None:
                lu[sr2] = idx
            
            if sr3 != None:
                if curr_instr.opcode == "store":
                    lu[sr3] = idx
            
            if len(LIVE) > MAXLIVE:
                MAXLIVE = len(LIVE)

            idx -= 1

    ## SECTION BELOW IS FOR CODE CHECK 2 ## 
    def insert_before(self, new_node, existing_node):
        """
        Inserts new_node before existing_node in the linked list.
        """
        if existing_node.prev is not None:
            existing_node.prev.next = new_node
            new_node.prev = existing_node.prev
        new_node.next = existing_node
        existing_node.prev = new_node
        if self.head == existing_node:
            self.head = new_node

    def allocate_registers(self, k):
        global max_vr, MAXLIVE, spill_location

        def get_PR(vr, nu):
            if len(PR_stack) > 0:
                pr = PR_stack.pop()
            else:
                print("test")
                pr = spill()
                PR_stack.pop()
            print("pr", pr)
            print("VRtoPR", VRtoPR)
            print("PRtoVR", PRtoVR)
            print("PRNU", PRNU)
            print("nu", nu)
            VRtoPR[vr] = pr
            PRtoVR[pr] = vr
            PRNU[pr] = nu
            return pr

        def free_PR(pr):
            VRtoPR[PRtoVR[pr]] = None
            PRtoVR[pr] = None
            PRNU[pr] = float('inf')
            PR_stack.append(pr)
        
        def spill():
            global spill_location

            # Pick pr with farthest next use
            unmarked_indices = [i for i in range(len(PRNU)) if i not in marked]

            pr_to_spill = max(unmarked_indices, key=lambda i: PRNU[i])
            vr_to_spill = PRtoVR[pr_to_spill]

            # Spill nodes to insert
            loadI_spill = ILOCNode("loadI", operand1=spill_location, operand3=pr_to_spill) 
            store_spill = ILOCNode("store", operand1=pr_to_spill, operand3=f"mem{vr_to_spill}") 
            
            # Track spillage
            VRtoSpillLoc[vr_to_spill] = spill_location

            # Insert LOADI and STORE nodes
            self.insert_before(loadI_spill, curr_node) 
            self.insert_before(store_spill, curr_node) 

            # Free the spilled PR
            free_PR(pr_to_spill)

            # Update spill location
            spill_location += 4

            return pr_to_spill
    
        def restore(vr, pr):
            loadI_restore = ILOCNode("loadI", operand1=VRtoSpillLoc[vr], operand3=pr)
            load_restore = ILOCNode("load", operand1=f"mem{vr}", operand3=pr) 

            self.insert_before(loadI_restore, curr_node) 
            self.insert_before(load_restore, curr_node) 
        
        # i am confused what this part does
        spill_reg = None
        if k < MAXLIVE:
            print("// RESERVING A REGISTER: k =", k, ", MAXLIVE =", MAXLIVE)
            spill_reg = k - 1
            k -= 1
        
        VRtoPR = [None] * (max_vr + 1) # VR to PR map (use max_reg + 1 for correct size)
        PRtoVR = [None] * k # PR to VR map
        PR_stack = list(range(k - 1, -1, -1)) # Stack of free PRs
        PRNU = [float('inf')] * k # Next-use array for PRs
        VRtoSpillLoc = [None for _ in range(max_vr + 1)]
        marked = [0] * k # Mark array for PRs

        # Iterate through linked list
        curr_node = self.head
        while curr_node:
            for mark in range(len(marked)):
                marked[mark] = 0

            print("currnode", curr_node)
            # Allocate PRs for uses (operand 1)
            if curr_node.operand1 != None:  
                # print("inside use for op1")
                pr = VRtoPR[curr_node.operand1]
                # VR doesn't have a PR, allocate one
                if pr == None:
                    curr_node.operand1 = get_PR(curr_node.operand1, curr_node.nu1)
                    if VRtoSpillLoc[curr_node.operand1] != None:
                        restore(curr_node.operand1, pr)
                # Mark PR as used
                marked[pr] = 1
                # Update operand to point to PR
                curr_node.operand1 = pr
            
            # Allocate PRs for uses (operand 2)
            if curr_node.operand2 != None:  
                # print("inside use for op2")
                pr = VRtoPR[curr_node.operand2]
                # VR doesn't have a PR, allocate one
                if pr == None:
                    curr_node.operand1 = get_PR(curr_node.operand2, curr_node.nu2)
                    if VRtoSpillLoc[curr_node.operand2] != None:
                        restore(curr_node.operand2, pr)
                # Mark PR as used
                marked[pr] = 1
                # Update operand to point to PR
                curr_node.operand2 = pr
            
            # Free PRs if operand1 or operand2 are no longer used (last use)
            if curr_node.nu1 == float('inf') and VRtoPR[curr_node.operand1] != None:
                free_PR(curr_node.operand1)
            if curr_node.nu2 == float('inf') and VRtoPR[curr_node.operand2] != None:
                free_PR(curr_node.operand2)

            # Allocate PR for operand3 (definition case)
            if curr_node.operand3 != None:
                pr = get_PR(curr_node.operand3, curr_node.nu3)
                # Mark PR as used
                marked[pr] = 1
                # Update operand to point to PR
                curr_node.operand3 = pr  
       
            curr_node = curr_node.next
    ## SECTION ABOVE IS CODE CHECK 2 ## 

    def print_renamed_ILOC(self):
        """
        Prints the renamed ILOC instructions after renaming registers.
        """
        curr = self.head
        while curr is not None:
            if curr.opcode == 'store':
                print(f"{curr.opcode}\t r{curr.arg1.sr} => r{curr.arg3.sr}")
            if curr.opcode == 'load':
                print(f"{curr.opcode}\t r{curr.arg1.sr} => r{curr.arg3.vr}")
            elif curr.opcode == 'loadI':
                print(f"{curr.opcode}\t {curr.arg1.sr} => r{curr.arg3.vr}")
            elif curr.opcode in ['add', 'sub', 'mult', 'lshift', 'rshift']:
                print(f"{curr.opcode}\t r{curr.arg1.sr}, r{curr.arg2.sr} => r{curr.arg3.vr}")
            elif curr.opcode == 'output':
                print(f"{curr.opcode}\t {curr.arg1.sr}")
            elif curr.opcode == 'nop':
                print(f"nop")
            curr = curr.next
    
    def max_sr(self):
        node = self.head
        max_sr = 0

        while node:
            max_sr = max(max_sr, node.max_sr())
            node = node.next
        
        return max_sr

