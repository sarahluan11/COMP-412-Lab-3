class Scheduler:
    def __init__(self, dependence_graph, rev_graph):
        self.graph = dependence_graph
        self.rev_graph = rev_graph
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

            # Select operations for this cycle
            op1, op2 = self.select_operations()
            selected_ops = [op for op in (op1, op2) if op is not None]

            for op in selected_ops:
                retire_cycle = self.cycle + self.get_latency(op)
                self.active.add((op, retire_cycle))
                instructions_this_cycle.append(op.instruction)
                # Mark as active
                op.status = 3  

            # Record the scheduled instructions or add NOP if no instructions were scheduled
            if instructions_this_cycle:
                self.schedule.append((self.cycle, instructions_this_cycle))
            else:
                self.schedule.append((self.cycle, ["nop", "nop"]))

            # Increment cycle and update sets
            self.cycle += 1
            self.update_active()

        return self.schedule
    
    def select_operations(self):
        """
        Select up to two operations from the ready set that satisfy the constraints:
        - No two loads in one cycle
        - No two stores in one cycle
        - No two mults in one cycle
        - No load and store in the same cycle
        """
        load_selected = False
        store_selected = False
        mult_selected = False

        selected_ops = []

        for node in sorted(self.ready, key=lambda n: n.priority, reverse=True):
            opcode = node.instruction.opcode

            if opcode == 'load':
                if load_selected or store_selected:  
                    continue
                load_selected = True
            elif opcode == 'store':
                if store_selected or load_selected: 
                    continue
                store_selected = True
            elif opcode == 'mult':
                if mult_selected: 
                    continue
                mult_selected = True
            else:
                pass

            selected_ops.append(node)
   
            if len(selected_ops) == 2:
                break

        for node in selected_ops:
            self.ready.remove(node)

        while len(selected_ops) < 2:
            selected_ops.append(None)

        return tuple(selected_ops)

    def update_active(self):
        """
        Removes completed operations from the Active set and adds successors to the Ready set.
        """
        completed = [
            (node, retire_cycle) for node, retire_cycle in self.active
            if self.cycle >= retire_cycle
        ]

        for node, retire_cycle in completed:
            
            self.active.remove((node, retire_cycle))
            # Mark as retired once removed from Active
            node.status = 4  

            # Check successors in the reverse graph
            for parent, _ in self.rev_graph.edges[node]:
                if parent.status == 1:
                    # Check if all parents of the successor are retired
                    if all(dep.status == 4 for dep, _ in self.graph.edges[parent]):
                        # Mark as ready
                        parent.status = 2  
                        self.ready.add(parent)

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