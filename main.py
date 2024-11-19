import sys
from allocator import Allocator
from scanner import scan, category_names, EOF
from parser_1 import parse, errors, print_ir
from iloc_ir import ILOCLinkedList
from contextlib import redirect_stdout
import os 

# Import dependencies for Lab 3
from dependence_graph import DependenceGraph
from scheduler import Scheduler  
# from scheduler import Scheduler  

# Logging for Lab 2
def get_log_name(input_path):
    base_name = os.path.splitext(os.path.basename(input_path))[0]
    log_file = f"{base_name}.i"

    log_dir = "logs"
    os.makedirs(log_dir, exist_ok=True)
    return os.path.join(log_dir, log_file)

def print_help():
    help_message = """
    COMP 412, Fall 2024, Allocator and Scheduler
    
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
        -d <name>    performs dependence graph construction and scheduling.
    
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
            elif arg in ['-s', '-p', '-r', '-x', '-d']:
                flag = arg
            else:
                print(f"ERROR: Unrecognized flag '{arg}'")
                sys.exit(1)
        elif arg.isdigit():
            num_registers = int(arg)
            if not (3 <= num_registers <= 64):
                print(f"ERROR: Invalid number of registers '{arg}'. Must be between 3 and 64.")
                sys.exit(1)
        else:
            input_file = arg

    # Ensure we have an input file
    if input_file is None:
        print("ERROR: No input file provided.")
        sys.exit(1)

    try:
        with open(input_file, 'r') as file:
            # If '-s' flag is used, scan and print all tokens
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

            # Parse the input file and handle flags '-r', '-x'
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

            # If '-x' flag is used, perform Code Check 1
            elif flag == '-x':
                ir.rename_registers()
                ir.print_renamed_ILOC()
                
            # If num_registers is used, perform Code Check 2
            elif num_registers:
                # Number of registers passed from command-line
                num_registers = int(sys.argv[1]) 
                 # Filepath passed from the command-line
                filepath = sys.argv[2] 
                
                # Create an instance of Allocator with the number of registers and the input file path
                allocator = Allocator(num_registers, ir)

                # Perform register allocation
                allocator.allocate_registers()

                # Print the renamed ILOC instructions
                allocator.int_rep.print_renamed_ILOC()
                
                # Redirect the stdout to a log file for testing purposes
                with open(get_log_name(filepath), 'w') as log_file:
                    with redirect_stdout(log_file):
                        allocator.int_rep.print_renamed_ILOC()
            
            # If '-d' flag is used, perform dependence graph construction and scheduling
            elif flag == '-d':
                # Step 1: Rename the registers
                ir.rename_registers()
                
                # Step 2: Build the dependence graph
                dependence_graph = DependenceGraph(ir)
                dependence_graph.build_graph()  
                dependence_graph.calculate_priorities()  
            
                # Save the regular dependence graph
                dependence_graph.save_as_dot("lab3_dependence_graph.dot")
                
                # Step 3: Build and save the transpose of the dependence graph
                dg = dependence_graph.reverse_graph()
                dg.save_as_dot("lab3_reverse_dependence_graph.dot")
                
                # Step 4: Schedule the instructions
                scheduler = Scheduler(dependence_graph)
                schedule = scheduler.schedule_operations()
                # Format the schedule into reference-style output
                formatted_schedule = scheduler.format_schedule()

                # Print the formatted schedule
                for cycle_output in formatted_schedule:
                    print(cycle_output)
            
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
