class Argument:
    """
    Represents an argument in an ILOC instruction, which could be a source register (sr), 
    physical register (pr), virtual register (vr), or next-use information (nu).
    
    Attributes:
    - sr (int): Source register.
    - pr (int): Physical register.
    - vr (int): Virtual register.
    - nu (int): Next-use information for register allocation.
    """
    def __init__(self, sr = None, pr = None, vr = None, nu = None):
        # Initialize the source register (sr)
        if sr is not None:
            self.sr = int(sr)
        else:
            self.sr = None
        
        # Initialize the physical register (pr)
        if pr is not None:
            self.pr = int(pr)
        else:
            self.pr = None
        
        # Initialize the virtual register (vr)
        if vr is not None:
            self.vr = int(vr)
        else:
            self.vr = None 
        
        # Initialize the next-use (nu) value for register allocation
        if nu is not None:
            self.nu = int(nu)
        else:
            self.nu = None

class ILOCNode:
    """
    Represents a node in the Intermediate Representation (IR) linked list.
    
    Each node corresponds to an ILOC instruction and has three arguments (arg1, arg2, arg3).
    
    Attributes:
    - arg1 (Argument): The first operand (could be source or destination).
    - arg2 (Argument): The second operand (optional).
    - arg3 (Argument): The third operand (destination or store source).
    - opcode (str): The ILOC operation code (e.g., "load", "add").
    - prev (ILOCNode): The previous node in the linked list.
    - next (ILOCNode): The next node in the linked list.
    """
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
            return "[ ]" 
        if isinstance(operand, int) or operand.isdigit():  
            return f"[ val {operand} ]"
        return f"[ s{operand} ]"  

    def __str__(self):
        """
        String representation of the ILOCNode, which is printed when the node is displayed.
        
        Outputs:
        - A string showing the opcode and its operands formatted nicely.
        """
        # Handle argument formatting
        if self.opcode == "loadI":
            arg1 = self.arg1.sr if self.arg1 and self.arg1.sr is not None else ""
        elif self.opcode == "output":
            arg1 = str(self.arg1.sr) if self.arg1 and self.arg1.sr is not None else ""
        else:
            arg1 = f"r{self.arg1.vr}" if self.arg1 and self.arg1.vr is not None else ""

        arg2 = f"r{self.arg2.vr}" if self.arg2 and self.arg2.vr is not None else ""
        arg3 = f"r{self.arg3.vr}" if self.arg3 and self.arg3.vr is not None else ""

        # Format for `=>` when there is a destination register
        if arg3:
            return f"{self.opcode.ljust(8)}{arg1}{f', {arg2}' if arg2 else ''} => {arg3}"
        elif arg2:
            return f"{self.opcode.ljust(8)}{arg1}, {arg2}"
        elif arg1:
            return f"{self.opcode.ljust(8)}{arg1}"
        else:
            return self.opcode.ljust(8)
        
    def max_sr(self):
        """
        Determines the maximum source register (sr) used by the node. 
        
        This is used to help in register allocation by knowing how many registers are involved.

        Returns:
        - The maximum source register used in the instruction.
        """
        args = [self.arg1, self.arg2, self.arg3]

        if self.opcode == "nop":
            return 0

        elif self.opcode == "loadI":
            # For loadI, we are only concerned with the destination register
            return args[2].sr 

        else:
            # Find the highest source register (sr) used in the instruction
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
        """
        Adds a new instruction node to the end of the linked list.
        
        Inputs:
        - node (ILOCNode): The instruction node to add.
        """
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
            print(current) 
            current = current.next
    
    def max_sr(self):
        """
        Returns the maximum source register (sr) used in the entire linked list.
        This is used for register allocation purposes.
        """
        node = self.head
        max_sr = 0

        while node:
            max_sr = max(max_sr, node.max_sr())
            node = node.next
        
        return max_sr
    
    def rename_registers(self):
        """
        Renames virtual registers (VR) to optimize register allocation using a next-use analysis.
        
        Returns:
        - max_vr (int): The highest virtual register used.
        - live (int): The maximum number of live registers during the renaming process.
        """
        # Tracks MAXLIVE value
        MAXLIVE = 0
        # Assume 2x source registers for safety
        max_reg = self.max_sr() * 2

        # Initializations
        max_vr = -1
        sr_to_vr = [None] * (max_reg + 1) 
        lu = [float('inf')] * (max_reg + 1)

        # Track live registers
        live = 0

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
                    live += 1

                live -= 1
                curr_instr.arg3.vr = sr_to_vr[sr3]
                curr_instr.arg3.nu = lu[sr3]
                sr_to_vr[sr3] = None
                lu[sr3] = float('inf')

            # Use cases
            if sr1 != None and curr_instr.opcode != "loadI" and curr_instr.opcode != "output":
                live += 1
                if sr_to_vr[sr1] == None:
                    max_vr += 1
                    sr_to_vr[sr1] = max_vr
                curr_instr.arg1.vr = sr_to_vr[sr1]
                curr_instr.arg1.nu = lu[sr1]

            if sr2 != None:
                live += 1
                if sr_to_vr[sr2] == None:
                    max_vr += 1
                    sr_to_vr[sr2] = max_vr
                    live += 1

                curr_instr.arg2.vr = sr_to_vr[sr2]
                curr_instr.arg2.nu = lu[sr2]

            # Operand 3 for store is always a use case
            if sr3 != None and curr_instr.opcode == "store":
                live += 1
                if sr_to_vr[sr3] == None:
                    max_vr += 1
                    sr_to_vr[sr3] = max_vr
                curr_instr.arg3.vr = sr_to_vr[sr3]
                curr_instr.arg3.nu = lu[sr3]
            
            if sr1 != None and curr_instr.opcode != 'loadI':
                lu[sr1] = idx

            if sr2 != None:
                lu[sr2] = idx
            
            if sr3 != None:
                if curr_instr.opcode == "store":
                    lu[sr3] = idx
            
            if live > MAXLIVE:
                MAXLIVE = live

            idx -= 1

        return max_vr, live

    def print_renamed_ILOC(self):
        """
        Prints the renamed ILOC instructions after renaming registers.
        """
        curr = self.head
        while curr is not None:
            if curr.opcode == 'store':
                print(f"{curr.opcode}\t r{curr.arg1.pr} => r{curr.arg3.pr}")
            if curr.opcode == 'load':
                print(f"{curr.opcode}\t r{curr.arg1.pr} => r{curr.arg3.pr}")
            elif curr.opcode == 'loadI':
                print(f"{curr.opcode}\t {curr.arg1.sr} => r{curr.arg3.pr}")
            elif curr.opcode in ['add', 'sub', 'mult', 'lshift', 'rshift']:
                print(f"{curr.opcode}\t r{curr.arg1.pr}, r{curr.arg2.pr} => r{curr.arg3.pr}")
            elif curr.opcode == 'output':
                print(f"{curr.opcode}\t {curr.arg1.sr}")
            elif curr.opcode == 'nop':
                print(f"nop")
            curr = curr.next

