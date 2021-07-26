#include<stdio.h>
int main() {
    int a;
    int b;
    int *p1;
    int *p2;
    a=1;
    b=2;
    p1=&a;
    p2=p1;
    *p1=3;
    b=*p2;
    
    printf("address of main: %p \n",main);
    printf("address of a: %p \n",&a);
    printf("address of b: %p \n",&b);
    printf("address of p1: %p \n",&p1);
    printf("address of p2: %p \n",&p2);
    printf("value of p1: %p \n",p1);
    printf("value of p2: %p \n",p2);
    printf("value of a: %p \n",a);
    printf("value of b: %p \n",b);
    printf("value of content  pointed by p1: %d \n",*p1);
    printf("value of content  pointed by p2: %d \n",*p2);
}