class Node:
    def __init__(self, instruction):
        """
        Represents a node in the dependence graph.
        Args:
            instruction (ILOCNode): The instruction this node represents.
        """
        self.instruction = instruction
        self.dependencies = []  
        self.priority = 0   


class DependenceGraph:
    def __init__(self, ir):
        """
        Initialize the dependence graph with the intermediate representation (IR) of instructions.
        Args:
            ir (ILOCLinkedList): The IR linked list containing instructions.
        """
        self.ir = ir
        self.nodes = []  
        self.edges = {}  
        
    
    def build_graph(self):
        # Maps each VR to the latest node that defines it
        last_def = {}  
        # Maps each VR to the latest node that uses it
        last_use = {}  

        # Track all previous memory operations (store, output)
        last_memory_ops = []

        current_instruction = self.ir.head
        while current_instruction:
            node = Node(current_instruction)
            self.nodes.append(node)
            self.edges[node] = []

            # Get the virtual registers defined and used by the current instruction
            defs = self.get_defs(current_instruction)
            uses = self.get_uses(current_instruction)

            # 1. Handle regular dependencies
            for vr in uses:
                if vr in last_def:
                    if current_instruction.opcode not in ["store"]:
                        self.add_edge(node, last_def[vr], "data", vr)

                if vr in last_use:
                    if current_instruction.opcode == "store":
                        self.add_edge(node, last_use[vr], "data", vr)

                last_use[vr] = node

            for vr in defs:
                if vr in last_def:
                    if current_instruction.opcode == "store" and last_def[vr].instruction.opcode == "store":
                        self.add_edge(node, last_def[vr], "data", vr)

                last_def[vr] = node

            # 2. Handle conflict edges (RAW)
            if current_instruction.opcode in ["load", "output"]:
                for mem_node in last_memory_ops:
                    if current_instruction.opcode == "load" and mem_node.instruction.opcode == "store":
                        self.add_edge(node, mem_node, "conflict", vr)
                    if current_instruction.opcode == "output" and mem_node.instruction.opcode == "store":
                        self.add_edge(node, mem_node,"conflict", vr)

            # 3. Handle serial edges 
            if current_instruction.opcode in ["store", "output"]:
                for mem_node in last_memory_ops:
                    # Output-output 
                    if current_instruction.opcode == "output" and mem_node.instruction.opcode == "output":
                        self.add_edge(node, mem_node,"serial", None)

                    # Store-store 
                    elif current_instruction.opcode == "store" and mem_node.instruction.opcode == "store":
                        self.add_edge(node, mem_node, "serial", None)

                # Add the current node to last_memory_ops as a memory operation
                last_memory_ops.append(node)

            # Move to the next instruction in the IR linked list
            current_instruction = current_instruction.next

        # Debug output: Print all nodes and their dependencies
        for i, node in enumerate(self.nodes):
            dep_list = [(self.nodes.index(dep_node) + 1, dep_type) for dep_node, dep_type in node.dependencies]
            print(f"Node {i + 1} ({node.instruction.opcode}): Dependencies -> {dep_list}")

    def add_edge(self, from_node, to_node, dep_type, vr):
        label = f"{dep_type}, vr{vr}" if vr is not None else dep_type
        from_node.dependencies.append((to_node, label))
        self.edges[from_node].append((to_node, label))

    def get_defs(self, instruction):
        """
        Get the registers defined (written) by an instruction.
        Args:
            instruction (ILOCNode): The instruction to analyze.
        
        Returns:
            list: A list of registers defined by the instruction.
        """
        defs = []
        if instruction.arg3 and instruction.opcode not in ["store"]:
            defs.append(instruction.arg3.vr)  
        return defs

    def get_uses(self, instruction):
        """
        Get the registers used (read) by an instruction.
        Args:
            instruction (ILOCNode): The instruction to analyze.
        
        Returns:
            list: A list of registers used by the instruction.
        """
        uses = []
        if instruction.arg1:
            uses.append(instruction.arg1.vr)
        if instruction.arg2:
            uses.append(instruction.arg2.vr)
        return uses

    def calculate_priorities(self):
        """
        Calculate the priority for each node based on dependencies.
        The priority helps guide the scheduler to optimize execution order.
        """
         # Reverse order for latency-weighted distance
        for node in reversed(self.nodes): 
            # Start with a base priority
            node.priority = 1
            for dep, _ in node.dependencies:
                # Latency-weighted depth
                node.priority = max(node.priority, dep.priority + 1) 

    
    def save_as_dot(self, filename="dependence_graph.dot"):
        """
        Save the dependence graph in Graphviz .dot format for visualization.
        Args:
            filename (str): The name of the output .dot file.
        """
        with open(filename, "w") as f:
            f.write("digraph DependenceGraph {\n")
            
            # Add nodes with line number, instruction, and priority
            for i, node in enumerate(self.nodes):
                line_number = i + 1  # Assuming line numbers start from 1

                # Format instruction text based on opcode, omitting "None" values
                if node.instruction.opcode == "loadI":
                    # Use 'sr' for 'loadI' and skip any None values
                    arg1_text = node.instruction.arg1.sr if node.instruction.arg1 else ""
                    arg3_text = node.instruction.arg3.vr if node.instruction.arg3 else ""
                    instruction_text = f"{node.instruction.opcode} {arg1_text} => {arg3_text}"

                elif node.instruction.opcode == "output":
                    # For 'output' instructions, only include non-None arguments
                    arg1_text = node.instruction.arg1.sr if node.instruction.arg1 else ""
                    instruction_text = f"{node.instruction.opcode} {arg1_text}"

                elif node.instruction.opcode == "store":
                    # For 'store' instructions, use 'arg1' and 'arg3' if they exist
                    arg1_text = node.instruction.arg1.vr if node.instruction.arg1 else ""
                    arg3_text = node.instruction.arg3.vr if node.instruction.arg3 else ""
                    instruction_text = f"{node.instruction.opcode} {arg1_text} => {arg3_text}"

                elif node.instruction.opcode == "load":
                    # For 'load' instructions, use 'arg1' if it exists and 'arg3'
                    arg1_text = node.instruction.arg1.vr if node.instruction.arg1 else ""
                    arg3_text = node.instruction.arg3.vr if node.instruction.arg3 else ""
                    instruction_text = f"{node.instruction.opcode} {arg1_text} => {arg3_text}"

                else:
                    # For other instructions, use 'vr' and handle non-None arguments
                    arg1_text = node.instruction.arg1.vr if node.instruction.arg1 else ""
                    arg2_text = node.instruction.arg2.vr if node.instruction.arg2 else ""
                    arg3_text = node.instruction.arg3.vr if node.instruction.arg3 else ""
                    instruction_text = f"{node.instruction.opcode} {arg1_text}, {arg2_text} => {arg3_text}"

                # Create label with line number, instruction, and priority
                label = f"{line_number}: {instruction_text}\\nprio: {node.priority}"
                f.write(f'    "{id(node)}" [label="{label}"];\n')
            
            # Add edges with dependency type and register labels
            for node in self.nodes:
                for dep_node, dep_info in node.dependencies:
                    f.write(f'    "{id(node)}" -> "{id(dep_node)}" [label="{dep_info}"];\n')
            
            f.write("}\n")
        print(f"Dependence graph saved as {filename}")
