class Scheduler:
    def __init__(self, dependence_graph):
        self.graph = dependence_graph
        # Current cycle
        self.cycle = 1  
        # Operations ready to execute
        self.ready = set(self.graph.leaf_nodes())  
        # Operations currently executing
        self.active = set()  
        # Final schedule
        self.schedule = []  

    def schedule_operations(self):
        """
        Schedule operations based on the dependence graph, allowing two instructions per cycle.
        """
        while self.ready or self.active:
            instructions_this_cycle = []

            # Schedule up to two instructions per cycle
            for _ in range(2):
                if self.ready:
                    op = max(self.ready, key=lambda node: node.priority)
                    self.ready.remove(op)
                    self.active.add((op, self.cycle))
                    instructions_this_cycle.append(op.instruction)

            # Record the scheduled instructions
            if instructions_this_cycle:
                self.schedule.append((self.cycle, instructions_this_cycle))

            # Increment cycle and update sets
            self.cycle += 1
            self.update_active()
            self.update_ready()

        return self.schedule


    def update_active(self):
        """
        Remove completed operations from the Active set.
        """
        completed = [
            (op, start_cycle) for op, start_cycle in self.active
            if self.cycle - start_cycle >= self.get_latency(op)
        ]
        for op, start_cycle in completed:
            self.active.remove((op, start_cycle))

    def update_ready(self):
        """
        Add operations to the Ready set if all dependencies are met.
        """
        for op, _ in self.active:
            for dep, _ in self.graph.edges[op]:
                if self.is_ready(dep):
                    self.ready.add(dep)


    def get_latency(self, node):
        """
        Get the latency for an operation.
        """
        latencies = {'load': 6, 'store': 6, 'mult': 3, 'add': 1, 'loadI': 1, 'output': 1}
        return latencies.get(node.instruction.opcode, 1)

    def is_ready(self, node):
        """
        Check if all dependencies for a node are met.
        """
        completed_nodes = {op for op, _ in self.active}.union(
            {op for op, _ in self.schedule}
        )
        for dep, _ in self.graph.edges[node]:
            if dep not in completed_nodes:
                return False
        return True
    
    def format_schedule(self):
        """
        Format the schedule for output, matching the reference format.
        """
        formatted_schedule = []
        for cycle, instructions in self.schedule:
            if len(instructions) == 1:
                formatted_schedule.append(f"[ {instructions[0]} ; nop ]")
            elif len(instructions) == 2:
                formatted_schedule.append(f"[ {instructions[0]} ; {instructions[1]} ]")
            else:
                formatted_schedule.append("[ nop ; nop ]")  # Default for empty cycles
        return formatted_schedule
