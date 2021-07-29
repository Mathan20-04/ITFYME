//Write a program to find maximum of two numbers using pointer (use functions to return either first or second is max)
#include<stdio.h>
#include<stdlib.h>
int max(int *a,int *b){
    if(*a>*b){
        return *a;
    }else{
        return *b;
    } 
}

int main() {
    int a=30;
    int b=20;
    int (*fn)(int *,int *);
    fn=&max;
    int max=fn(&a,&b);
    printf("max=%d\n",max);
       
}