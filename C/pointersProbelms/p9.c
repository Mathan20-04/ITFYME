//Write a program to store “n” elements (character) in an array and print the array. 
//Use dynamic allocation; ask user to enter the number of elements
#include <stdio.h>
#include <stdlib.h>
int main() {
    int n;
    char *i;
    printf("enter n");
    scanf("%d",&n);
    char *p=(char*)calloc(n,sizeof(char));
    for( i=p;i<(p+n);i++){
        scanf("%c",i);
        scanf("%c",i);
    }
    printf("array elemets are\n");
    for( i=p;i<(p+n);i++){
        printf("%c\n",*i);
    }
}