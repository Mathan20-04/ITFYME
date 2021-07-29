#include<stdio.h>
int main() {
    int a=5;
    int *p;
    p=&a;
    printf("address of main: %p \n",main);
    printf("address of a: %p \n",&a);
    printf("address of p: %p \n",&p);
    printf("value of p: %p \n",p);
    printf("value of a: %p \n",a);
    printf("value of content  pointed by p: %d \n",*p);
}