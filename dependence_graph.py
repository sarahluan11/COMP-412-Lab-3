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
    
    def build_graph(self):
        """
        Build the dependence graph by analyzing dependencies between instructions in the IR.
        """
        current_instruction = self.ir.head
        while current_instruction:
            node = self.Node(current_instruction)
            self.nodes.append(node)
            current_instruction = current_instruction.next

        # Establish dependencies by analyzing each instruction
        for i, node in enumerate(self.nodes):
            self.edges[node] = []

            for j in range(i + 1, len(self.nodes)):
                dependent_node = self.nodes[j]

                # Check if there is any dependency and get its type
                dependency_type = self.is_dependent(node.instruction, dependent_node.instruction)
                if dependency_type:
                    node.dependencies.append((dependent_node, dependency_type))  # Store with type
                    self.edges[node].append((dependent_node, dependency_type))  # Store with type


    def is_dependent(self, instr1, instr2):
        """
        Check if instr2 depends on instr1 and determine the type of dependency.
        Args:
            instr1 (ILOCNode): The first instruction.
            instr2 (ILOCNode): The second instruction.
        
        Returns:
            str: Dependency type ("Data", "Conflict", "Serial") if instr2 depends on instr1, otherwise None.
        """
        instr1_defs = self.get_defs(instr1)
        instr2_uses = self.get_uses(instr2)

        # Check for RAW dependency (Data dependency)
        if any(d in instr2_uses for d in instr1_defs):
            return "Data"
        
        instr2_defs = self.get_defs(instr2)

        # Check for WAR or WAW dependencies
        if any(d in instr2_defs for d in instr1_defs):
            return "Conflict" if instr1.opcode in ["store", "load"] and instr2.opcode in ["store", "load"] else "Serial"

        return None
    
    def get_defs(self, instruction):
        """
        Get the registers defined (written) by an instruction.
        Args:
            instruction (ILOCNode): The instruction to analyze.
        
        Returns:
            list: A list of registers defined by the instruction.
        """
        defs = []
        if instruction.arg3 and instruction.opcode not in ["load", "store"]:
            defs.append(instruction.arg3.sr)  # Assuming arg3 is the destination register
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
            uses.append(instruction.arg1.sr)
        if instruction.arg2:
            uses.append(instruction.arg2.sr)
        return uses

    def calculate_priorities(self):
        """
        Calculate the priority for each node based on dependencies.
        The priority helps guide the scheduler to optimize execution order.
        """
        for node in reversed(self.nodes):  # Reverse order for latency-weighted distance
            node.priority = 1  # Base priority value; customize based on scheduling heuristics
            for dep, _ in node.dependencies:  # Separate the dependent node and the dependency type
                node.priority = max(node.priority, dep.priority + 1)  # Latency-weighted depth

    
    def save_as_dot(self, filename="dependence_graph.dot"):
        """
        Save the dependence graph in Graphviz .dot format for visualization.
        Args:
            filename (str): The name of the output .dot file.
        """
        with open(filename, "w") as f:
            f.write("digraph DependenceGraph {\n")
            
            # Add nodes with line number and instruction
            for i, node in enumerate(self.nodes):
                line_number = i + 1  # Assuming line numbers start from 1
                instruction_text = f"{node.instruction.opcode} " \
                                   f"{node.instruction.arg1.sr if node.instruction.arg1 else ''}, " \
                                   f"{node.instruction.arg2.sr if node.instruction.arg2 else ''} => " \
                                   f"{node.instruction.arg3.sr if node.instruction.arg3 else ''}"
                label = f"{line_number}: {instruction_text}"
                f.write(f'    "{id(node)}" [label="{label}"];\n')
            
            # Add edges with dependency type labels
            for node in self.nodes:
                for dep_node, dep_type in node.dependencies:
                    f.write(f'    "{id(node)}" -> "{id(dep_node)}" [label="{dep_type}"];\n')
            
            f.write("}\n")
        print(f"Dependence graph saved as {filename}")
