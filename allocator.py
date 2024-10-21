from parser_1 import parse


class Allocator:
    def __init__(self, k: int, filepath: str):
        self.k = k
        self.filepath = filepath

        with open(filepath, 'r') as file:
            result, _ = parse(file)
        
        # Rename the internal representation
        result.rename_registers()

        self.int_rep = result

        self.MAXLIVE = result.rename_registers()[1]
        self.vr_count = result.rename_registers()[0]
        self.VRToSpillLoc = [None for _ in range(self.vr_count + 1)]
        self.VRToPR = [None] * (self.vr_count + 1)
        self.PRToVR = [None] * k
        self.PRToNU = [float('inf')] * k
        self.PRStack = list(range(k - 1, -1, -1))
        self.next_spill_location = 32768
        self.marked = [0] * k



