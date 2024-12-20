class Node:
    def __init__(self, instruction):
        """
        Represents a node in the dependence graph.
        Args:
            instruction (ILOCNode): The instruction this node represents.
        """
        self.instruction = instruction
        self.priority = 0
        self.status = 1  # 1: not ready, 2: ready, 3: active, 4: retired

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
            
            if len(defs) > 0:
                last_def[defs[0]] = node

            # 1. Handle regular dependencies
            for vr in uses:
                if vr in last_def:
                   self.add_edge(node, last_def[vr], "data", vr)

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
    
    def reverse_graph(self):
        """
        Reverse the direction of all edges in the dependence graph.
        """
        ir = self.ir
        res = DependenceGraph(ir)
        res.nodes = self.nodes

        # Initialize a new dictionary to hold reversed edges
        reversed_edges = {node: [] for node in self.nodes}

        # Iterate over each node and its dependencies
        for from_node in self.nodes:
            for to_node, dep_info in self.edges[from_node]:
                # Reverse the edge direction
                reversed_edges[to_node].append((from_node, dep_info))

        # Replace the original edges with the reversed edges
        res.edges = reversed_edges

        return res

    def add_edge(self, from_node, to_node, dep_type, vr):
        label = f"{dep_type}, vr{vr}" if vr is not None else dep_type
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
        if instruction.opcode == 'output':
            return []
        
        uses = []
        if instruction.arg1:
            uses.append(instruction.arg1.vr)
        if instruction.arg2:
            uses.append(instruction.arg2.vr)
        if instruction.arg3 and instruction.opcode == 'store':
            uses.append(instruction.arg3.vr)
        return uses

    def calculate_priorities(self):
        """
        Calculate the priority for each node based on dependencies.
        The priority helps guide the scheduler to optimize execution order.
        """
        # Set operation latencies
        latencies = {
            'load': 6,
            'store': 6,
            'mult': 3
        }

        # Initialize incoming edges count to find root nodes
        incoming_count = {node: 0 for node in self.nodes}
        for from_node in self.nodes:
            for to_node, _ in self.edges[from_node]:
                incoming_count[to_node] += 1
        
        # Identify root nodes (nodes with no incoming edges)
        root_nodes = [node for node in self.nodes if incoming_count[node] == 0]
        
        # Calculate the max latency-weighted path for each node starting from root nodes
        def max_latency_path(node):
            # Memoize result to avoid recomputation
            if hasattr(node, 'max_latency'):  
                return node.max_latency

            # Get the latency for this operation, defaulting to 1 if not specified
            latency = latencies.get(node.instruction.opcode, 1)
            # Start with the latency of the current node
            max_path = latency  

            # Calculate latency-weighted path for each incoming edge and take the max
            for from_node, _ in [(n, info) for n in self.nodes for dep, info in self.edges[n] if dep == node]:
                max_path = max(max_path, max_latency_path(from_node) + latency)

            # Store result in node attribute for memoization
            node.max_latency = max_path  
            return max_path

        # Compute max latency-weighted path for each node
        for node in self.nodes:
            max_latency_path(node)

        for node in self.nodes:
            node.priority = node.max_latency

        # For debugging
        # for i, node in enumerate(self.nodes):
        #     print(f"Node {i + 1} ({node.instruction.opcode}): Latency Priority -> {node.priority}")

    def leaf_nodes(self):
        leaves = []
        for node in self.nodes:
            # Check if the node has no outgoing edges
            if not self.edges[node]: 
                leaves.append(node)
                node.status = 2
        return leaves

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
                for dep_node, dep_info in self.edges[node]:
                    f.write(f'    "{id(node)}" -> "{id(dep_node)}" [label="{dep_info}"];\n')
            
            f.write("}\n")
