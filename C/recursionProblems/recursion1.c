//write a program to find factorial of number using Recursion 
#include<stdio.h>
int fact(int n) {
    //base condition
    if(n==1) {
        return 1;
    } 
    return n*fact(n-1);
}
int main() {
    int a;
    printf("Enter number\n");
    scanf("%d",&a);
    printf("factorial of %d is %d",a,fact(a));

    
}
 