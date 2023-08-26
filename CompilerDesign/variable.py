import re

def is_valid_variable_name(variable_name):
    # Define the regular expression pattern for a valid variable name
    pattern = r'^[a-zA-Z_][a-zA-Z0-9_]*$'
    
    # Use re.match to check if the variable_name matches the pattern
    match = re.match(pattern, variable_name)
    
    # If match is not None, the variable_name is valid
    if match:
        return True
    else:
        return False

# Test cases
variable_names = ["myVariable123", "_underscoreVar", "123Invalid", "spaces not allowed"]
for name in variable_names:
    if is_valid_variable_name(name):
        print(f" '{name}' is a valid variable name.")
    else:
        print(f" '{name}' is not a valid variable name.")
 
