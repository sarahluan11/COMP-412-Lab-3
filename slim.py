def allocate(k):
    global num_vrs, MAXLIVE, head_node, spill_location, PRNU

    # Returns the next PR to use. Updates maps accordingly
    # Input: the vr to store along with it's next use
    # Ouput: the pr chosen
    def getPR(vr, nu):
        if len(PR_stack) > 0:
            x = PR_stack.pop()
        # For this assignment, addresses above 32,767 are reserved for the register allocator to use as spill locations
        else:
            x = spill()
            PR_stack.pop()
        VRtoPR[vr] = x
        PRtoVR[x] = vr
        PRNU[x] = nu
        return x
    
    # Frees a given pr and adds it back to the stack of available PRs
    # Input: int representing a pr
    # Output: None
    def freePR(pr):
        VRtoPR[PRtoVR[pr]] = None
        PRtoVR[pr] = None
        PRNU[pr] = float('inf')
        PR_stack.append(pr)
    
    # Spills a pr based on which pr will be used the farthest from now
    # Input: the current node and index we are at within the IR
    # Returns the pr that will we spill
    def spill():
        global spill_location
        # Create a list of unmarked indices
        unmarked_indices = [i for i in range(len(PRNU)) if i not in marked]
        # pick the pr with the farthest next use
        pr_to_spill = max(unmarked_indices, key=lambda i: PRNU[i])

        vr_to_spill = PRtoVR[pr_to_spill]

        # Spill nodes to insert
        loadI_spill = IrNode(curr.line, loadI, spill_location, None, None, None, None, None, None, None, None, None, None, spill_reg, index)
        store_spill = IrNode(curr.line, store, None, None, vr_to_spill, pr_to_spill, None, None, None, None, None, None, None, spill_reg, float('inf'))
        
        # Track spillage
        VRtoSpillLoc[vr_to_spill] = spill_location

        # Insert LOADI and STORE nodes
        insert_before(loadI_spill, curr)
        insert_before(store_spill, curr)

        # VRtoPR[vr_to_spill] = None
        # PRtoVR[pr_to_spill] = None
        freePR(pr_to_spill)

        # Update spill location
        spill_location += 4

        return pr_to_spill
    
    def restore(vr, pr):
        loadI_restore = IrNode(curr.line, loadI, VRtoSpillLoc[vr], None, None, None, None, None, None, None, None, None, None, pr, index)
        load_restore = IrNode(curr.line, load, None, None, None, pr, None, None, None, None, None, None, vr, pr, index)

        insert_before(loadI_restore, curr)
        insert_before(load_restore, curr)

        # Reset so that the reg is no longer stored in memory
        # !! IS THIS CORRECT
        # VRtoSpillLoc[vr] = None
    
    spill_reg = None
    if k < MAXLIVE:
        print("// RESERVING A REGISTER: k =", k, ", MAXLIVE =", MAXLIVE)
        spill_reg = k - 1
        k -= 1

    VRtoPR = [None for _ in range(num_vrs + 1)]
    PRtoVR = [None for _ in range(k)] #, NOT SURE IF WE NEED THIS
    PRNU = [float('inf') for _ in range(k)] #, NOT SURE IF WE NEED THIS
    VRtoSpillLoc = [None for _ in range(num_vrs + 1)]

    # PR_stack = [i for i in range(k)]
    PR_stack = [i for i in range(k-1, -1, -1)]

    # Node we are one
    curr = head_node
    # Line number we are on in the IR representation (for NU purposes)
    index = 0

    # keep track of 
    marked = []

    while curr != None:
        marked = set()

        if curr.vr1 != None:
            pr = VRtoPR[curr.vr1]
            if pr == None:
                curr.pr1 = getPR(curr.vr1, curr.nu1)

                # Check if this vr was spilled
                if VRtoSpillLoc[curr.vr1] != None:
                    restore(curr.vr1, curr.pr1)
            else:
                curr.pr1 = pr
            marked.add(curr.pr1)

        if curr.vr2 != None:
            pr = VRtoPR[curr.vr2]
            if pr == None:
                curr.pr2 = getPR(curr.vr2, curr.nu2)

                # Check if this vr was spilled
                if VRtoSpillLoc[curr.vr2] != None:
                    restore(curr.vr2, curr.pr2)
            else:
                curr.pr2 = pr
            marked.add(curr.pr2)

        if curr.op == store and curr.vr3 != None:
            pr = VRtoPR[curr.vr3]
            if pr == None:
                curr.pr3 = getPR(curr.vr3, curr.nu3)

                # Check if this vr was spilled
                if VRtoSpillLoc[curr.vr3] != None:
                    restore(curr.vr3, curr.pr3)
            else:
                curr.pr3 = pr
            marked.add(curr.pr3)

        # Free the pr's that have an infinite next use
        if curr.vr1 != None:
            if curr.nu1 == float('inf') and PRtoVR[curr.pr1] != None:
                freePR(curr.pr1)
        if curr.vr2 != None:
            if curr.nu2 == float('inf') and PRtoVR[curr.pr2] != None:
                freePR(curr.pr2)
        if curr.op == store and curr.vr3 != None:
            if curr.nu3 == float('inf') and PRtoVR[curr.pr3] != None:
                freePR(curr.pr3)
        
        # Reset marks
        marks = set()

        if curr.op != store and curr.vr3 != None:
            curr.pr3 = getPR(curr.vr3, curr.nu3)
            marks.add(curr.pr3)

        # Move onto next node
        curr = curr.next
        index += 1

# Function to print the allocated ILOC code
# Input:
# - None
# Output:
# - Prints renamed ILOC code
def print_allocated_ILOC():
    global head_node
    curr = head_node
    lines = []
    while curr != None:
        if curr.op == load or curr.op == store:
            str_line = values[curr.op] + "\t" + "r" + str(curr.pr1) + " => " + "r" + str(curr.pr3)
        elif curr.op == loadI:
            str_line = values[curr.op] + "\t" + str(curr.const) + " => " + "r" + str(curr.pr3)
        elif curr.op == add or curr.op == sub or curr.op == mult or curr.op == lshift or curr.op == rshift:
            str_line = values[curr.op] + "\t" + "r" + str(curr.pr1) + ", " + "r" + str(curr.pr2) + " => " + "r" + str(curr.pr3)
        elif curr.op == output:
            str_line =  values[curr.op] + "\t" + str(curr.const)
        elif curr.op == nop:
            str_line = "nop"
        lines.append(str_line)
        print(str_line, file=sys.stdout)
        curr = curr.next

    with open('output.i', 'w') as file:
        file.write('\n'.join(lines) + '\n')