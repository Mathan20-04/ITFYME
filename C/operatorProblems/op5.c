#include<stdio.h>
int main(int arg,char *argv[]){
    float a=3.123;
    printf("intial value of a is %f \n",a);
    a=a+23.437;
    printf("final value of a is %f \n",a);
    printf("final value of a is %.3f \n",a);
    return 1;
}