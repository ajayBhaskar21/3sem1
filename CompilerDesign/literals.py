import re

def identify_literal_type(literal):
    # Integer literal pattern
    int_pattern = r'^[+-]?\d+$'
    
    # Floating-point literal pattern
    float_pattern = r'^[+-]?\d+\.\d*|\.\d+$'
    
    # String literal pattern
    string_pattern = r'^".*"$'
    
    # Character literal pattern
    char_pattern = r"^'.{1}'$"
    
    if re.match(int_pattern, literal):
        return "Integer"
    elif re.match(float_pattern, literal):
        return "Floating-point"
    elif re.match(string_pattern, literal):
        return "String"
    elif re.match(char_pattern, literal):
        return "Character"
    else:
        return "Unknown"

# Test cases
literals = ["123", "-45", "3.14", "-0.5", ".7", "\"Hello, world!\"", "'A'", "'123'", "'AB'"]
for lit in literals:
    literal_type = identify_literal_type(lit)
    print(f"{lit} is a {literal_type} literal.")
