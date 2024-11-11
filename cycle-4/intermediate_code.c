#include <stdio.h>
#include <string.h>

void gen_code_for_operator(char *inp, char operator, char *reg) 
{
    int i = 0, j = 0;
    char temp[100];
    while (inp[i] != '\0') 
    {
        if (inp[i] == operator) 
        {
            // Print the intermediate code in the form of "Operator Destination Arg1 Arg2"
            printf("%c\t%c\t%c\t%c\n", operator, *reg, inp[i - 1], inp[i + 1]);
            temp[j - 1] = *reg;  // Replace the last character in `temp` with the register
            i += 2;              // Skip over the operator and the next operand
            (*reg)--;            // Move to the next register (Z, Y, X, etc.)
            continue;
        }
        temp[j] = inp[i];
        i++;
        j++;
    }
    temp[j] = '\0';
    strcpy(inp, temp);  // Update `inp` with the modified expression after processing the operator
}

void gen_code(char *inp) 
{
    // Operator precedence - /, *, +, -, =
    char reg = 'Z';  
    gen_code_for_operator(inp, '/', &reg);  // Process division
    gen_code_for_operator(inp, '*', &reg);  // Process multiplication
    gen_code_for_operator(inp, '+', &reg);  // Process addition
    gen_code_for_operator(inp, '-', &reg);  // Process subtraction
    gen_code_for_operator(inp, '=', &reg);  // Process assignment
}

int main() 
{
    char inp[100];
    printf("Enter expression:\n");
    scanf("%s", inp);  // Read input expression as a single string
    printf("Op  \tDestn\tArg1\tArg2\n");  // Print header for intermediate code
    gen_code(inp);  // Generate intermediate code
    return 0;
}
