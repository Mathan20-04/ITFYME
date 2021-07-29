//write a program find a Fibbonacci series of number using Recursion
#include<stdio.h>
int fib(int n) {
    if(n==0) {
        return 0;
    }
    if(n==1) {
        return 1;
    } else {
        return fib(n-1)+fib(n-2);                                  
    }        
}  

int main() {
    int a;
    int n;
    printf("enter n\n");
    scanf("%d",&n);
    for(int i=0;i<n;i++) {
        printf("%d\n",fib(a));
        a++;
    }
}
 