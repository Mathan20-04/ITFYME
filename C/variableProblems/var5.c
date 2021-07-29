#include<stdio.h>
#include<stdbool.h>
#include<string.h>
 
int main(){
    char a='A';
    bool b=1;
    char str[]="mathan";
    printf("value of a is %c and size of char datatype is %d \n",a,sizeof(char));
    printf("value of b is %d and size of bool datatype is %d \n",b,sizeof(bool));
    printf("value of str is %s and size of string datatype is %d \n",str,sizeof(str));

}

