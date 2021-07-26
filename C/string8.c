/* Function to print permutations of string
This function takes three parameters:
1. String
2. Starting index of the string
3. Ending index of the string. */

// C program to print all permutations with duplicates allowed
#include <stdio.h>
#include <string.h>
 
/* Function to swap values at two pointers */
void swap(char *x, char *y)
{
    char temp;
    printf("%c %c\n",*x,*y);
    temp = *x;
    *x = *y;
    *y = temp;
}
void permute(char *a, int f, int l)
{
int i;
if (f == l)
    printf("%s\n", a);
else
{
    for (i = f; i <= l; i++)
    {
        swap((a+f), (a+i));
        permute(a, f+1, l);
        swap((a+f), (a+i)); //backtrack
    }
}
}
 
/* Driver program to test above functions */
int main()
{
    char str[] = "AB";
    int n = strlen(str);
    permute(str, 0, n-1);
    return 0;
}