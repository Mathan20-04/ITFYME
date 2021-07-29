//Write a program to add two integer pointers and print its address, number and sum of its number
#include<stdio.h>
#include<stdlib.h>

int main() {
    int *p1;         //pointer 1
    int *p2;         //pointer 2
    int a=10;        //assign a value
    int b=20;        //assign b value
    p1=&a;           //assign p1 to address of a
    p2=&b;           //assign p2 to address of b
    int sum=*p1+*p2; //add both pointer and store in sum
    printf("address a:%p value of a:%d\n",&a,a);
    printf("address b:%p value of b:%d\n",&b,b); 
    printf("address p1:%p value of p1:%d\n",&p1,*p1);  
    printf("address p2:%p value of p2:%d\n",&p2,*p2);
    printf("sum = %d",sum);
    }