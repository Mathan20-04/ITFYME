#include<stdio.h>
int main() {
    int *p1;
    char *p2;
    double *p3;
    int a=0;
    printf("address of a=%x and value of a:%d \n",&a,a);
    printf("address of p1=%x and value of p1:%x and points to %d \n",&p1,p1,*p1);
    printf("address of p2=%x and value of p2:%x \n",&p2,p2);
    a++;
    p1++;
    p2++;
    p3++;
    printf("address of a=%x and value of a:%d \n",&a,a);
    printf("address of p1=%x and value of p1:%x and points to %d \n",&p1,p1,*p1);
    printf("address of p2=%x and value of p2:%x \n",&p2,p2);

       
}