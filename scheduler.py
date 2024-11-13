class Scheduler:
    def __init__(self, dependence_graph):
        """
        Initializes the Scheduler with a dependence graph.
        Args:
            dependence_graph (DependenceGraph): The dependence graph to be scheduled.
        """
        self.graph = dependence_graph
        # Start the scheduling at cycle 1
        self.cycle = 1
        # Initialize ready set to the leaf nodes
        self.ready = set(self.graph.leaf_nodes())
        # Set that is currently being executed but not completed
        self.active = set()
        # List to store the final schedule in (cycle, operation) format
        self.schedule = []

    def schedule_operations(self):
        """
        Main scheduling function. This function iterates through cycles, 
        moving operations from the ready set to the active set, and updates the cycle count.
        Returns:
            list: The complete schedule as a list of tuples (cycle, operation).
        """
        # Continues looping while either Ready or Active isn't empty
        while self.ready or self.active:
            # Schedule the highest priority operation from Ready to Active
            if self.ready:
                op = max(self.ready, key=lambda node: node.priority)
                self.ready.remove(op)
                # Track start cycle
                self.active.add((op, self.cycle))  
                # Add to final schedule
                self.schedule.append((self.cycle, op.instruction))  
            
            # Increment cycle and check for completion in Active
            self.cycle += 1
            # Check and remove completed operations
            self.update_active()
            # Add any newly available operations to Ready
            self.update_ready()

        return self.schedule

    def update_active(self):
        """
        Updates the Active set by checking if any operations have completed.
        Moves completed operations out of Active.
        """
        # Determine completed operations based on their start cycle and latency
        completed = [
            (op, start_cycle) for op, start_cycle in self.active
            if self.cycle - start_cycle >= self.get_latency(op)
        ]

        # Remove completed operations from Active set
        for op, start_cycle in completed:
            self.active.remove((op, start_cycle))
    
    def update_ready(self):
        """
        Updates the Ready set by adding operations whose dependencies are now satisfied.
        This is triggered by the completion of operations in Active.
        """
        # Check dependencies of each operation in the Active set
        for op, _ in self.active:
            for dep in self.graph.edges[op]:
                # If an operation's dependencies are satisfied, add it to Ready
                if self.is_ready(dep):
                    self.ready.add(dep)

    def get_latency(self, node):
        """
        Returns the execution latency for a given operation node.
        Args:
            node (Node): The operation node to get the latency for.
        Returns:
            int: The latency for the operation type.
        """
        # Return the latency for the operation, defaulting to 1 if not specified
        latencies = {'load': 6, 'store': 6, 'mult': 3}
        return latencies.get(node.instruction.opcode, 1)

    def is_ready(self, node):
        """
        Checks if all dependencies for a given node have been satisfied.
        This means that each of its dependencies is either completed or active.
        Args:
            node (Node): The node to check readiness for.
        Returns:
            bool: True if all dependencies are satisfied, False otherwise.
        """
        # Check all dependencies for the node in the dependence graph
        for dep, _ in self.graph.edges[node]:
            # If any dependency is not yet completed, the node is not ready
            if dep not in self.completed:
                return False
        return True
