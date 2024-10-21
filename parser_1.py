from scanner import scan, category_names
from iloc_ir import Argument, ILOCLinkedList, ILOCNode

# Categories
MEMOP = 0
LOADI = 1
ARITHOP = 2
OUTPUT = 3
NOP = 4
CONSTANT = 5
REGISTER = 6
COMMA = 7
INTO = 8
EOF = 9
EOL = 10

curr_line = None
curr_lexeme = None
curr_token = None
# List to store error messages
errors = []  
# Intermediate representation (IR) to store parsed instructions
ir = ILOCLinkedList()

def print_ir():
    """
    Prints the IR (Intermediate Representation) if it has been populated with instructions.
    If no IR has been generated, prints a message indicating so.
    """
    global ir
    if ir and ir.head: 
        # Calls the print method of the IR linked list
        ir.print_instructions()
    else:
        print("No IR generated.")

def next_token(input_stream):
    """
    Retrieves the next token from the input stream using the scanner.
    Automatically skips newlines and handles errors in lexemes.

    Inputs:
    - input_stream: The input file stream to read from.

    Outputs:
    - The current line, token, and lexeme. If the token is EOF, returns None.
    """
    global curr_line, curr_lexeme, curr_token
    while True:
        result = scan(input_stream)
        # Handle invalid words
        if isinstance(result, tuple) and result[0] == "ERROR":  
            curr_line, curr_token, curr_lexeme = result[1], "ERROR", result[2]
            errors.append(f"ERROR {curr_line}: \"{curr_lexeme}\" is not a valid word.")
            # Report error but don't skip the line
            return curr_line, curr_token, curr_lexeme  
        else:
            curr_line, curr_token, curr_lexeme = result
            # End of file
            if curr_token == category_names[EOF]:
                return None  
            return curr_line, curr_token, curr_lexeme
    
def parse_memop(input_stream):
    """
    Parses memory operations (MEMOP) such as load or store.
    Expects MEMOP REG INTO REG.

    Inputs:
    - input_stream: A file-like object representing the input file for the scanner.

    Outputs:
    - True if the MEMOP is successfully parsed.
    - False and logs an error if the expected tokens (REGISTER, INTO, REGISTER) are not found.
    """
    opcode = curr_lexeme
    next_token(input_stream)
    if curr_token == category_names[REGISTER]:
        src_register = curr_lexeme
        next_token(input_stream)
        if curr_token == category_names[INTO]:
            next_token(input_stream)
            if curr_token == category_names[REGISTER]:
                dest_register = curr_lexeme

                if opcode == "load":
                    node = ILOCNode(arg1=Argument(sr=src_register), arg2=Argument(), arg3=Argument(sr = dest_register), opcode="load")
                    ir.add_instruction(node)
                elif opcode == "store":
                    ir.add_instruction(ILOCNode(arg1=Argument(sr=src_register), arg2=Argument(), arg3=Argument(sr = dest_register), opcode="store" ))
                else:
                    errors.append(f"ERROR {curr_line}: Unrecognized memory operation '{opcode}'.")

                next_token(input_stream)

                if curr_token not in [category_names[EOF], category_names[EOL]]:
                    errors.append(f"ERROR {curr_line}: Extra token at end of line \"{curr_lexeme}\" ({curr_token}).")
                return True 
            else:

                errors.append(f"ERROR {curr_line}: Missing target register in load or store.")
        else:
            errors.append(f"ERROR {curr_line}: Missing '=>' in load or store.")
    else:
        errors.append(f"ERROR {curr_line}: Missing source register in load or store.")
    return False

def parse_load_i(input_stream):
    """
    Parses the LOADI operation. 
    Expects LOADI CONSTANT INTO REG.

    Inputs:
    - input_stream: A file-like object representing the input file for the scanner.

    Outputs:
    - True if the LOADI operation is successfully parsed.
    - False and logs an error if the expected tokens (CONSTANT, INTO, REGISTER) are not found.
    """
    next_token(input_stream)
    if curr_token == category_names[CONSTANT]:
        constant_value = curr_lexeme
        next_token(input_stream)
        if curr_token == category_names[INTO]:
            next_token(input_stream)
            if curr_token == category_names[REGISTER]:
                dest_register = curr_lexeme
                ir.add_instruction(ILOCNode(arg1=Argument(sr=constant_value), arg2=Argument(), arg3=Argument(sr = dest_register), opcode="loadI"))
                next_token(input_stream)
                # Check if there are extra tokens after the instruction
                if curr_token not in [category_names[EOF], category_names[EOL]]:
                    errors.append(f"ERROR {curr_line}: Extra token at end of line \"{curr_lexeme}\" ({curr_token}).")
                # Successful parsing
                return True 
            else:
                errors.append(f"ERROR {curr_line}: Missing target register in load or store.")
        else:
            errors.append(f"ERROR {curr_line}: Missing '=>' in loadI.")
    else:
        errors.append(f"ERROR {curr_line}: Missing constant in loadI.")
    return False

def parse_arithop(input_stream):
    """
    Parses arithmetic operations (ARITHOP), such as add, sub, or mult.
    Expects ARITHOP REG COMMA REG INTO REG.

    Inputs:
    - input_stream: A file-like object representing the input file for the scanner.

    Outputs:
    - True if the ARITHOP is successfully parsed.
    - False and logs an error if the expected tokens (REGISTER, COMMA, REGISTER, INTO, REGISTER) are not found.
    """
    opcode = curr_lexeme
    next_token(input_stream)
    if curr_token == category_names[REGISTER]:
        src1_register = curr_lexeme
        next_token(input_stream)
        if curr_token == category_names[COMMA]:
            next_token(input_stream)
            if curr_token == category_names[REGISTER]:
                src2_register = curr_lexeme
                next_token(input_stream)
                if curr_token == category_names[INTO]:
                    next_token(input_stream)
                    if curr_token == category_names[REGISTER]:
                        dest_register = curr_lexeme
                        ir.add_instruction(ILOCNode(arg1=Argument(sr=src1_register), arg2=Argument(src2_register), arg3=Argument(sr = dest_register), opcode=opcode))
                        next_token(input_stream)
                        # Check if there are extra tokens after the instruction
                        if curr_token not in [category_names[EOF], category_names[EOL]]:
                            errors.append(f"ERROR {curr_line}: Extra token at end of line \"{curr_lexeme}\" ({curr_token}).")
                        # Successful parsing
                        return True  
                    else:
                        errors.append(f"ERROR {curr_line}: Missing target register in mult.")
                else:
                    errors.append(f"ERROR {curr_line}: Missing '=>' after second .")
            else:
                errors.append(f"ERROR {curr_line}: Missing second source register in add.")
        else:
            errors.append(f"ERROR {curr_line}: Missing comma in add.")
    else:
        errors.append(f"ERROR {curr_line}: Missing first souce register in add.")
    return False

def parse_output(input_stream):
    """
    Parses the OUTPUT operation.
    Expects OUTPUT CONSTANT.

    Inputs:
    - input_stream: A file-like object representing the input file for the scanner.

    Outputs:
    - True if the OUTPUT operation is successfully parsed.
    - False and logs an error if a constant is not found after the OUTPUT keyword.
    """
    next_token(input_stream)
    if curr_token == category_names[CONSTANT]:
        output_value = curr_lexeme
        ir.add_instruction(ILOCNode(arg1=Argument(sr=output_value), arg2=Argument(), arg3=Argument(), opcode="output"))
        next_token(input_stream)
        # Check if there are extra tokens after the instruction
        if curr_token not in [category_names[EOF], category_names[EOL]]:
                    errors.append(f"ERROR {curr_line}: Extra token at end of line \"{curr_lexeme}\" ({curr_token}).")
        # Successful parsing
        return True  
    else:
        errors.append(f"ERROR {curr_line}: Missing constant in output.")
    return False

def parse_nop(input_stream):
    """
    Parses the NOP (No Operation) command.
    Expects NOP.

    Inputs:
    - input_stream: A file-like object representing the input file for the scanner.

    Outputs:
    - True indicating that the NOP operation is successfully parsed.
    """
    next_token(input_stream)
    ir.add_instruction(ILOCNode(arg1=Argument(), arg2=Argument(), arg3=Argument(), opcode = "nop"))
    # NOP is always successfully parsed
    return True 

def parse(input_stream):
    """
    Main parsing function that takes an input stream, processes it, and prints the results.

    Inputs:
    - input_stream: A file-like object representing the input file for the scanner.

    Outputs:
    - If errors are found, prints the list of errors followed by "Parse found errors."
    - If no errors are found, prints "Parse succeeded. Processed X operations."
    """
    global errors, ir
    global curr_line, curr_token, curr_lexeme
    ir = ILOCLinkedList()
    # Keeps track of successfully parsed operations
    operation_count = 0

    # Reset the IR for new parsing
    ir = ILOCLinkedList()

    def handle_production():
        """Helper function to handle the production rules for parsing."""
        nonlocal operation_count
        if curr_token == category_names[MEMOP]:
            if parse_memop(input_stream):
                operation_count += 1
        elif curr_token == category_names[LOADI]:
            if parse_load_i(input_stream):
                operation_count += 1
        elif curr_token == category_names[ARITHOP]:
            if parse_arithop(input_stream):
                operation_count += 1
        elif curr_token == category_names[OUTPUT]:
            if parse_output(input_stream):
                operation_count += 1
        elif curr_token == category_names[NOP]:
            if parse_nop(input_stream):
                operation_count += 1
        elif curr_token == category_names[REGISTER] or curr_token == category_names[CONSTANT]:
            next_token(input_stream)
    
    next_token(input_stream)  
    
    try:
        while curr_token != category_names[EOF]:
            handle_production()  
            next_token(input_stream)
        return ir, operation_count
    except Exception as e:
        errors.append(f"Unexpected Error: {e}")
        return ir, operation_count
