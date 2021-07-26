#include<stdio.h>
int main(int arg,char *argv[]){
    int a;
    printf("enter value of a \n");
    scanf("%d",&a);
    printf("intial value of a is %d \n",a);
    a=a*(15/3*2)*(32/4);
    printf("final value of a is %d \n",a);
    return 1;
}