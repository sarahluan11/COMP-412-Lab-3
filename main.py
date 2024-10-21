import sys
from scanner import scan, category_names, EOF
from parser_1 import parse, errors, print_ir
from iloc_ir import ILOCLinkedList

def print_help():
    help_message = """
    COMP 412, Fall 2024, Allocator (412alloc)
    
    Command Syntax:
        ./412alloc [flags] <name>
    
    Required arguments:
        <name>  is the pathname (absolute or relative) to the input file containing the ILOC block.

    Optional flags:
        -h           prints this help message and stops execution
        -s <name>    scans and prints all tokens from the input file.
        -p <name>    parses the input file and prints the intermediate representation (IR).
        -r <name>    parses and renames the input file, prints the renamed IR.
        -x <name>    renames and prints the results to stdout (Code Check 1 only).
    
    Format:
        k <name>     where k is the number of registers available to the allocator (3 ≤ k ≤ 64)
                     If k is outside this range or the input file <name> cannot be opened, 
                     the program should print an error and exit. Otherwise, it should 
                     scan, parse, and allocate using registers r0 to rk-1 and print the 
                     resulting code to stdout.
    """
    print(help_message)

def main():
    argc = len(sys.argv)

    if argc < 2:
        print("Usage: ./412alloc [flags] [filename]")
        sys.exit(1)

    input_file = None
    num_registers = None
    flag = None

    # Parse command-line arguments
    for arg in sys.argv[1:]:
        if arg.startswith('-'):
            if arg == '-h':
                print_help()
                sys.exit(0)
            elif arg in ['-s', '-p', '-r', '-x']:
                flag = arg
            else:
                print(f"ERROR: Unrecognized flag '{arg}'")
                sys.exit(1)
        elif arg.isdigit():
            # Number of registers (k)
            num_registers = int(arg)
            if not (3 <= num_registers <= 64):
                print(f"ERROR: Invalid number of registers '{arg}'. Must be between 3 and 64.")
                sys.exit(1)
        else:
            # This is the input filename
            input_file = arg

    # Ensure we have an input file
    if input_file is None:
        print("ERROR: No input file provided.")
        sys.exit(1)

    try:
        with open(input_file, 'r') as file:
            # Step 1: If '-s' flag is used, scan and print all tokens
            if flag == '-s':
                print("Scanning tokens...")
                while True:
                    token = scan(file)
                    if token[1] == category_names[EOF]:
                        print(f"{token[0]}: < {token[1]}, \"{token[2]}\" >")
                        break
                    elif token[1] == 'REG':
                        print(f"{token[0]}: < {token[1]}, \"r{token[2]}\" >")
                        continue
                    print(f"{token[0]}: < {token[1]}, \"{token[2]}\" >")
                return

            # Step 2: Parse the input file and handle flags '-r', '-x'
            ir, operation_count = parse(file)

            # Check if there are any errors in parsing
            if errors:
                print("Parsing failed. Errors found:", file=sys.stderr)
                print("\n".join(errors), file=sys.stderr)
                sys.exit(1)

            # If '-r' flag is used, print the IR
            if flag == '-r':
                print("Intermediate Representation (IR):")
                print_ir()

            # If '-x' flag is used, perform Code Check 1 renaming and print the results
            elif flag == '-x':
                # Rename registers and print the renamed ILOC
                ir.rename_registers()
                ir.print_renamed_ILOC()
                
            # Handle Code Check 2: Register Allocation with Spilling if necessary
            elif num_registers:
                print(f"Allocating with {num_registers} registers...")
                
                # Perform register allocation with `num_registers` physical registers.
                ir.rename_registers()
                ir.allocate_registers(num_registers)
                ir.print_renamed_ILOC()

            # If no valid flag or number of registers is provided, show an error
            else:
                print("ERROR: No valid flag or number of registers provided. Try '-h' for help.")
                sys.exit(1)

    except FileNotFoundError:
        print(f"ERROR: File '{input_file}' not found.", file=sys.stderr)
    except Exception as e:
        print(f"ERROR: {str(e)}", file=sys.stderr)

if __name__ == "__main__":
    main()
