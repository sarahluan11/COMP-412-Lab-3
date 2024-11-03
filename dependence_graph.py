class DependenceGraph:
    def __init__(self, ir):
        """
        Initialize the dependence graph with the intermediate representation (IR) of instructions.
        Args:
            ir (ILOCLinkedList): The IR linked list containing instructions.
        """
        self.ir = ir
        self.nodes = []  # List of nodes in the graph
        self.edges = {}  # Dictionary mapping each node to its dependencies (edges)
    
    class Node:
        def __init__(self, instruction):
            """
            Represents a node in the dependence graph.
            Args:
                instruction (ILOCNode): The instruction this node represents.
            """
            self.instruction = instruction
            self.dependencies = []  # List of nodes that this node depends on
            self.priority = 0       # Calculated priority for scheduling
    
    def build_graph(self):
        """
        Build the dependence graph by analyzing dependencies between instructions in the IR.
        """
        # Create nodes for each instruction in the IR
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

                # Check if 'node' has any dependency on 'dependent_node'
                if self.is_dependent(node.instruction, dependent_node.instruction):
                    node.dependencies.append(dependent_node)
                    self.edges[node].append(dependent_node)

    def is_dependent(self, instr1, instr2):
        """
        Check if instr2 depends on instr1 (e.g., instr2 uses a result produced by instr1).
        Args:
            instr1 (ILOCNode): The first instruction.
            instr2 (ILOCNode): The second instruction.
        
        Returns:
            bool: True if instr2 depends on instr1, False otherwise.
        """
        # Example logic for dependency checks (customize this based on ILOC syntax):
        # Dependency Types:
        # 1. Read-after-write (RAW): instr2 reads a register written by instr1
        # 2. Write-after-read (WAR): instr2 writes a register read by instr1
        # 3. Write-after-write (WAW): instr2 writes a register written by instr1

        instr1_defs = self.get_defs(instr1)
        instr2_uses = self.get_uses(instr2)

        # RAW dependency (instr2 uses a register written by instr1)
        if any(d in instr2_uses for d in instr1_defs):
            return True
        
        instr2_defs = self.get_defs(instr2)

        # WAR or WAW dependency
        if any(d in instr2_defs for d in instr1_defs):
            return True

        return False
    
    def get_defs(self, instruction):
        """
        Get the registers defined (written) by an instruction.
        Args:
            instruction (ILOCNode): The instruction to analyze.
        
        Returns:
            list: A list of registers defined by the instruction.
        """
        # Example implementation based on instruction format
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
            for dep in node.dependencies:
                node.priority = max(node.priority, dep.priority + 1)  # Latency-weighted depth
    
    def save_as_dot(self, filename="dependence_graph.dot"):
        """
        Save the dependence graph in Graphviz .dot format for visualization.
        Args:
            filename (str): The name of the output .dot file.
        """
        with open(filename, "w") as f:
            f.write("digraph DependenceGraph {\n")
            
            # Add nodes
            for node in self.nodes:
                label = f"{node.instruction.opcode}"
                f.write(f'    "{id(node)}" [label="{label}"];\n')
            
            # Add edges based on dependencies
            for node in self.nodes:
                for dep in node.dependencies:
                    f.write(f'    "{id(node)}" -> "{id(dep)}";\n')
            
            f.write("}\n")
        print(f"Dependence graph saved as {filename}")
