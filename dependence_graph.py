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
        current_instruction = self.ir.head
        while current_instruction:
            node = self.Node(current_instruction)
            self.nodes.append(node)
            current_instruction = current_instruction.next

        for i, node in enumerate(self.nodes):
            self.edges[node] = []

            for j in range(i + 1, len(self.nodes)):
                dependent_node = self.nodes[j]

                # Check if there is any dependency and get its type and register
                dependency_type, reg = self.is_dependent(node.instruction, dependent_node.instruction)

                # Debug output: Print the detected dependency
                print(f"Checking dependency from Node {i + 1} ({node.instruction.opcode}) "
                  f"to Node {j + 1} ({dependent_node.instruction.opcode}): {dependency_type}, {reg}")
                
                if dependency_type:
                    print(f"Adding {dependency_type} dependency from {node.instruction} to {dependent_node.instruction}")
                    node.dependencies.append((dependent_node, f"{dependency_type}, vr{reg}"))
                    self.edges[node].append((dependent_node, f"{dependency_type}, vr{reg}"))
        
          # Debug output: Print all nodes and their dependencies
        for i, node in enumerate(self.nodes):
            dep_list = [(j + 1, dep_type) for j, (dep_node, dep_type) in enumerate(node.dependencies)]
            print(f"Node {i + 1} ({node.instruction.opcode}): Dependencies -> {dep_list}")

    def is_dependent(self, instr1, instr2):
        """
        Check if instr2 depends on instr1 and determine the type of dependency.
        Args:
            instr1 (ILOCNode): The first instruction.
            instr2 (ILOCNode): The second instruction.

        Returns:
            tuple: (Dependency type, Register involved) if instr2 depends on instr1, otherwise (None, None).
        """
        instr1_defs = self.get_defs(instr1)
        instr2_uses = self.get_uses(instr2)
        instr2_defs = self.get_defs(instr2)

        # Check for RAW (Read After Write) dependency: instr1 writes to a register used by instr2
        for d in instr1_defs:
            if d in instr2_uses:
                return "RAW", d

        # Check for WAR (Write After Read) dependency: instr1 reads a register written by instr2
        for u in instr2_uses:
            if u in instr1_defs:
                return "WAR", u

        # Check for WAW (Write After Write) dependency: both instr1 and instr2 write to the same register
        for d in instr1_defs:
            if d in instr2_defs:
                return "WAW", d

        # Serialization dependency for two output instructions
        if instr1.opcode == "output" and instr2.opcode == "output":
            return "Serialization", None

        # Check for dependencies involving store and other instructions based on address conflicts
        if instr1.opcode == "store":
            if instr2.opcode == "store":
                return "Serialization", None  # store store requires serialization
            elif instr2.opcode in ["load", "output"]:
                for d in instr1_defs:
                    if d in instr2_uses:
                        return "Conflict", d  # store load or store output with address conflict

        # Check for WAR dependency with load followed by store at the same address
        if instr1.opcode in ["load", "output"] and instr2.opcode == "store":
            for d in instr2_defs:
                if d in instr1_defs:
                    return "WAR", d

        return None, None

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
            defs.append(instruction.arg3.vr)  # Assuming arg3 is the destination register
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
        for node in reversed(self.nodes):  # Reverse order for latency-weighted distance
            # Start with a base priority
            node.priority = 1
            for dep, _ in node.dependencies:
                node.priority = max(node.priority, dep.priority + 1)  # Latency-weighted depth

    
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
                instruction_text = f"{node.instruction.opcode} " \
                                   f"{node.instruction.arg1.sr if node.instruction.arg1 else ''}, " \
                                   f"{node.instruction.arg2.sr if node.instruction.arg2 else ''} => " \
                                   f"{node.instruction.arg3.sr if node.instruction.arg3 else ''}"
                label = f"{line_number}: {instruction_text}\\nprio: {node.priority}"
                f.write(f'    "{id(node)}" [label="{label}"];\n')
            
            # Add edges with dependency type and register labels
            for node in self.nodes:
                for dep_node, dep_info in node.dependencies:
                    f.write(f'    "{id(node)}" -> "{id(dep_node)}" [label="{dep_info}"];\n')
            
            f.write("}\n")
        print(f"Dependence graph saved as {filename}")

