import sys

BUFFER_SIZE = 4096

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
INVALID = 11

category_names = [
    "MEMOP", "LOADI", "ARITHOP", "OUTPUT", "NOP", "CONST", 
    "REG", "COMMA", "INTO", "ENDFILE", "NEWLINE", "INVALID"
]

# Predefined patterns for keywords 
patterns = {
    'load': MEMOP,
    'store': MEMOP,
    'loadI': LOADI,
    'add': ARITHOP,
    'sub': ARITHOP,
    'mult': ARITHOP,
    'lshift': ARITHOP,
    'rshift': ARITHOP,
    'output': OUTPUT,
    'nop': NOP
}

# Global variables
buffer = []
input_pointer = 0
line_number = 1

def fill_buffer(input_stream):
    """
    Fills the buffer with data from the input stream.

    Inputs:
    - input_stream: A file-like object representing the input file.
    
    Returns:
    - True if data was successfully read into the buffer.
    - False if the input stream has no more data (EOF).
    """
    global buffer
    # Read next chunk into the buffer
    buffer = list(input_stream.read(BUFFER_SIZE))  
    # Return True if buffer has data, False if EOF
    return len(buffer) > 0  


def next_char(input_stream):
    """
    Retrieves the next character from the buffer and advances the input pointer.
    Optimized to minimize buffer refills and handle buffer efficiently.
    
    Inputs:
    - input_stream: A file-like object representing the input file.

    Returns:
    - The next character from the buffer, or None if EOF.
    """
    global input_pointer, buffer

    # If we've reached the end of the current buffer, refill the buffer
    if input_pointer >= len(buffer):
        contents = fill_buffer(input_stream)
        # Attempt to refill the buffer
        if not contents:
            return None  # Return None if there's no more data to read (EOF)
        input_pointer = 0  # Reset input pointer after buffer refill

    # Return the next character and increment the pointer
    char = buffer[input_pointer]
    input_pointer += 1
    return char

def rollback():
    """
    Moves the input pointer back by one character in the buffer.
    """
    global input_pointer
    if input_pointer > 0:
        input_pointer -= 1

def scan(input_stream):
    """
    Scans the input stream for lexical tokens and returns them one at a time. 
    If an error is encountered, it skips the rest of the line and moves to the next one.

    Inputs:
    - input_stream: A file-like object representing the input file.

    Returns:
    - A tuple representing a token in the format (line_number, category_name, lexeme).
    """
    global input_pointer, buffer, line_number

    # Initially fill the buffer if it is empty
    if not buffer:
        fill_buffer(input_stream)

    lexeme = ""

    while True:
        char = next_char(input_stream)

        # Handle EOF
        if char is None:
            error_token = (line_number, category_names[EOF], "")
            return error_token

        # Handle new lines
        if char == '\n':
            token = (line_number, category_names[EOL], "\\n")
            line_number += 1
            lexeme = ""
            return token

        # Handle whitespace (other than newlines)
        if char.isspace():
            continue

        # Handle comma
        if char == ',':
            return (line_number, category_names[COMMA], ',')

        # Check for "=>"
        if char == '=':
            next_c = next_char(input_stream)
            if next_c == '>':
                token = (line_number, category_names[INTO], "=>")
                return token
            else:
                rollback()
                error_token = ("ERROR", line_number, lexeme)
                return error_token
            
        # Check for keywords first (e.g., rshift, load, etc.)
        if char.isalpha():
            lexeme = char
            while True:
                next_c = next_char(input_stream)
                if next_c is None or not next_c.isalpha():
                    rollback()
                    break
                lexeme += next_c
            if lexeme in patterns:
                token = (line_number, category_names[patterns[lexeme]], lexeme)
                return token

            # If not a keyword, we handle it further down for potential register
            if lexeme == 'r':
                next_c = next_char(input_stream)
                if next_c is not None and next_c.isdigit():
                    lexeme += next_c
                    while True:
                        next_c = next_char(input_stream)
                        if next_c is None or not next_c.isdigit():
                            rollback()
                            break
                        lexeme += next_c
                    token = (line_number, category_names[REGISTER], lexeme[1:])
                    return token
                else:
                    rollback() 
                    return ("ERROR", line_number, lexeme) 

            
        # Handle constants
        if char.isdigit():
            lexeme = char
            while True:
                next_c = next_char(input_stream)
                if next_c is None or not next_c.isdigit():
                    rollback()
                    break
                lexeme += next_c
            return (line_number, category_names[CONSTANT], lexeme)

        # Handle comments (//)
        if char == '/':
            next_c = next_char(input_stream)
            if next_c == '/':
                # Skip the rest of the line
                while char != '\n' and char is not None:
                    char = next_char(input_stream)
                token = (line_number, category_names[EOL], "\\n")
                line_number += 1
                return token
            else:
                while char != '\n' and char is not None:
                    char = next_char(input_pointer)
                rollback()
                error_token = ("ERROR", line_number, lexeme)
                return error_token

        # Handle invalid characters
        error_token = ("ERROR", line_number, lexeme)
        while char != '\n' and char is not None:
            char = next_char(input_pointer)
        rollback()
        return error_token

