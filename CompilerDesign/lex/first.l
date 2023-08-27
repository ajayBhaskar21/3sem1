%{
#include <stdio.h>
#undef yywrap
#define yywrap() 1
%}

%%

auto        { printf("%s - AUTO\n", yytext); }
break       { printf("%s - BREAK\n", yytext); }
case        { printf("%s - CASE\n", yytext); }
char        { printf("%s - CHAR\n", yytext); }
const       { printf("%s - CONST\n", yytext); }
continue    { printf("%s - CONTINUE\n", yytext); }
default     { printf("%s - DEFAULT\n", yytext); }
do          { printf("%s - DO\n", yytext); }
double      { printf("%s - DOUBLE\n", yytext); }
else        { printf("%s - ELSE\n", yytext); }
enum        { printf("%s - ENUM\n", yytext); }
extern      { printf("%s - EXTERN\n", yytext); }
float       { printf("%s - FLOAT\n", yytext); }
for         { printf("%s - FOR\n", yytext); }
goto        { printf("%s - GOTO\n", yytext); }
if          { printf("%s - IF\n", yytext); }
int         { printf("%s - INT\n", yytext); }
long        { printf("%s - LONG\n", yytext); }
register    { printf("%s - REGISTER\n", yytext); }
return      { printf("%s - RETURN\n", yytext); }
short       { printf("%s - SHORT\n", yytext); }
signed      { printf("%s - SIGNED\n", yytext); }
sizeof      { printf("%s - SIZEOF\n", yytext); }
static      { printf("%s - STATIC\n", yytext); }
struct      { printf("%s - STRUCT\n", yytext); }
switch      { printf("%s - SWITCH\n", yytext); }
typedef     { printf("%s - TYPEDEF\n", yytext); }
union       { printf("%s - UNION\n", yytext); }
unsigned    { printf("%s - UNSIGNED\n", yytext); }
void        { printf("%s - VOID\n", yytext); }
volatile    { printf("%s - VOLATILE\n", yytext); }
while       { printf("%s - WHILE\n", yytext); }

"("         { printf("%s - LEFT ROUND BRACKET\n", yytext); }
")"         { printf("%s - RIGHT ROUND BRACKET\n", yytext); }
"{"         { printf("%s - LEFT CURLY BRACKET\n", yytext); }
"}"         { printf("%s - RIGHT CURLY BRACKET\n", yytext); }
"["         { printf("%s - LEFT SQUARE BRACKET\n", yytext); }
"]"         { printf("%s - RIGHT SQUARE BRACKET\n", yytext); }

"+"         { printf("%s - PLUS\n", yytext); }
"-"         { printf("%s - MINUS\n", yytext); }
"*"         { printf("%s - MULTIPLICATION\n", yytext); }
"/"         { printf("%s - DIVISION\n", yytext); }

"=="        { printf("%s - EQUAL\n", yytext); }
"!="        { printf("%s - NOT EQUAL\n", yytext); }
"<="        { printf("%s - LESS THAN OR EQUAL\n", yytext); }
">="        { printf("%s - GREATER THAN OR EQUAL\n", yytext); }
"<"         { printf("%s - LESS THAN\n", yytext); }
">"         { printf("%s - GREATER THAN\n", yytext); }

"&&"        { printf("%s - LOGICAL AND\n", yytext); }
"||"        { printf("%s - LOGICAL OR\n", yytext); }
"!"         { printf("%s - LOGICAL NOT\n", yytext); }

"&"         { printf("%s - BITWISE AND\n", yytext); }
"^"         { printf("%s - BITWISE XOR\n", yytext); }
"|"         { printf("%s - BITWISE OR\n", yytext); }
"<<"        { printf("%s - LEFT SHIFT\n", yytext); }
">>"        { printf("%s - RIGHT SHIFT\n", yytext); }
"~"         { printf("%s - BITWISE NOT\n", yytext); }

"="         { printf("%s - ASSIGNMENT\n", yytext); }
"+="        { printf("%s - ADD AND ASSIGN\n", yytext); }
"-="        { printf("%s - SUBTRACT AND ASSIGN\n", yytext); }
"*="        { printf("%s - MULTIPLY AND ASSIGN\n", yytext); }
"/="        { printf("%s - DIVIDE AND ASSIGN\n", yytext); }
"%="        { printf("%s - MODULO AND ASSIGN\n", yytext); }
"&="        { printf("%s - BITWISE AND AND ASSIGN\n", yytext); }
"|="        { printf("%s - BITWISE OR AND ASSIGN\n", yytext); }
"^="        { printf("%s - BITWISE XOR AND ASSIGN\n", yytext); }
"<<="       { printf("%s - LEFT SHIFT AND ASSIGN\n", yytext); }
">>="       { printf("%s - RIGHT SHIFT AND ASSIGN\n", yytext); }

"++"        { printf("%s - INCREMENT\n", yytext); }
"--"        { printf("%s - DECREMENT\n", yytext); }


"?"         { printf("%s - TERNARY CONDITIONAL\n", yytext); }
":"         { printf("%s - TERNARY COLON\n", yytext); }


","         { printf("%s - COMMA\n", yytext); }
";"         { printf("%s - SEMICOLON\n", yytext);}

[a-zA-Z_][a-zA-Z0-9_]* { printf("%s - IDENTIFIER\n", yytext); }
[0-9]+      { printf("%s - INTEGER LITERAL\n", yytext); }
[0-9]*\.[0-9]+ { printf("%s - FLOATING POINT LITERAL\n", yytext); }
\".*\"      { printf("%s - STRING LITERAL\n", yytext); }
[ \t\n]     { /* Ignore whitespace */ }
.           { printf("%s - OTHER\n", yytext); }

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    
    FILE* inputFile = fopen(argv[1], "r");
    if (!inputFile) {
        printf("Unable to open file %s\n", argv[1]);
        return 1;
    }
    
    yyin = inputFile;
    yylex();
    
    fclose(inputFile);
    return 0;
}
