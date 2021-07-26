//Write a program to print Fibonacci series without using recursion?
#include <stdio.h>
int main(){
    int n1=0,n2=1,n3,num;
    printf("Enter a num\n");
    scanf("%d",&num);
    printf("Fibonacci Series\n");
    printf(" %d %d ",n1,n2);
    for(int i=2;i<num;i++){
        n3=n1+n2;
        printf("%d ",n3);
        n1=n2;
        n2=n3;
    }
}