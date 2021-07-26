#include<stdio.h>
#include<stdbool.h>
#include<string.h>
 
int main(){
    char a;
    bool b;
    char str[]="mathan";
    a='A';
    b=0;
    printf("value of a is %c and size of char datatype is %d \n",a,sizeof(char));
    printf("value of b is %u and size of bool datatype is %d \n",b,sizeof(bool));
    printf("value of str is %s and size of string datatype is %d \n",str,sizeof(str));

 }

