class Scheduler:
    def __init__(self, dependence_graph):
        self.graph = dependence_graph
        # Current cycle
        self.cycle = 1  
        # Operations ready to execute
        self.ready = set(self.graph.leaf_nodes())  
        # Operations currently executing (node, retire cycle)
        self.active = set() 
        # Final schedule 
        self.schedule = []  

    def schedule_operations(self):
        """
        Schedules operations based on the dependence graph, allowing up to two instructions per cycle.
        """
        while self.ready or self.active:
            instructions_this_cycle = []

            # DEBUG: Ready set at start
            print(f"Cycle {self.cycle}: Ready set contains:")
            for node in self.ready:
                print(f"  - {node.instruction} (Status: {node.status})")

            # Schedule up to two instructions per cycle
            for _ in range(2):
                if self.ready:
                    # Find operation with max priority
                    op = max(self.ready, key=lambda node: node.priority)
                    self.ready.remove(op)
                    retire_cycle = self.cycle + self.get_latency(op)
                    self.active.add((op, retire_cycle))
                    instructions_this_cycle.append(op.instruction)
                    # Mark as active
                    op.status = 3  

                    # DEBUG: Switching to Active
                    print(f"  Scheduled {op.instruction} (Status changed to {op.status})")

            # Record scheduled instructions for the current cycle
            if instructions_this_cycle:
                self.schedule.append((self.cycle, instructions_this_cycle))

            # DEBUG: Print the instructions scheduled in this cycle
            print(f"Cycle {self.cycle}: Scheduled instructions:")
            for inst in instructions_this_cycle:
                print(f"  - {inst}")

            # Increment cycle and update sets
            self.cycle += 1
            self.update_active()

            # # DEBUG: Print active set with status
            # print(f"Cycle {self.cycle - 1}: Active set contains:")
            # for op, retire_cycle in self.active:
            #     print(f"  - {op.instruction} (Status: {op.status})")

        return self.schedule

    def update_active(self):
        """
        Removes completed operations from the Active set and adds successors to the Ready set.
        """
        completed = [
            (node, retire_cycle) for node, retire_cycle in self.active
            if self.cycle >= retire_cycle
        ]

        for node, retire_cycle in completed:
            print(f"Completing {node.instruction} at cycle {self.cycle}")
            self.active.remove((node, retire_cycle))
            # Mark as retired once removed from Active
            node.status = 4  
            print(f"  {node.instruction} (Status changed to {node.status})")

            # Check successors in the reverse graph
            for potential_successor in self.graph.nodes:
                for parent, _ in self.graph.edges[potential_successor]:
                    if parent == node:
                        # Check if all parents of the successor are retired
                        if all(dep.status == 4 for dep, _ in self.graph.edges[potential_successor]):
                            # Mark as ready
                            potential_successor.status = 2  
                            self.ready.add(potential_successor)
                            print(f"  {potential_successor.instruction} added to Ready set (Status changed to {potential_successor.status})")

    def get_latency(self, node):
        """
        Returns the latency for a given operation based on its opcode.
        """
        latencies = {'load': 6, 'store': 6, 'mult': 3, 'add': 1, 'loadI': 1, 'output': 1}
        return latencies.get(node.instruction.opcode, 1)

    def format_schedule(self):
        """
        Formats the schedule for output, matching the reference format.
        """
        formatted_schedule = []
        for cycle, instructions in self.schedule:
            if len(instructions) == 1:
                formatted_schedule.append(f"[ {instructions[0]} ; nop ]")
            elif len(instructions) == 2:
                formatted_schedule.append(f"[ {instructions[0]} ; {instructions[1]} ]")
            else:
                formatted_schedule.append("[ nop ; nop ]")
        return formatted_schedule