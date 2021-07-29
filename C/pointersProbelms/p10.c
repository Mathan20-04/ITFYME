//Write a program to swap two elements (int) using functions
#include<stdio.h>
#include<stdlib.h>
int swap(int *a,int *b){
    int temp=*a;
    *a=*b;
    *b=temp;
    printf("after swap a=%d b=%d\n",*a,*b);
}
int main() {
    int a=40;
    int b=70;
    printf("before swap a=%d b=%d\n",a,b);
    int (*fn)(int *,int *);
    fn=&swap;
    int swap=fn(&a,&b); 
 
}