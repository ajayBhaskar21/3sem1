import re

def extract_c_keywords(code):
    keywords = [
        "auto", "break", "case", "char", "const", "continue",
        "default", "do", "double", "else", "enum", "extern",
        "float", "for", "goto", "if", "int", "long", "register",
        "return", "short", "signed", "sizeof", "static", "struct",
        "switch", "typedef", "union", "unsigned", "void", "volatile",
        "while"
    ]
    
    keyword_pattern = r'\b(' + '|'.join(keywords) + r')\b'
    matches = re.findall(keyword_pattern, code)
    
    return matches

# Test case: Replace with your own C code snippet
c_code = """
// C program to add two numbers
#include <stdio.h>

int main()
{
    int A, B, sum = 0;

    // Ask user to enter the two numbers
    printf("Enter two numbers A and B : \n");

    // Read two numbers from the user || A = 2, B = 3
    scanf("%d%d", &A, &B);

    // Calculate the addition of A and B
    // using '+' operator
    sum = A + B;

    // Print the sum
    printf("Sum of A and B is: %d", sum);

    return 0;
}

"""

c_keywords = extract_c_keywords(c_code)
print("Keywords found:", c_keywords)
