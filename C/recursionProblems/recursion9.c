//write a program to find a value of sum divided by count of number using Recursion
#include<stdio.h>
int sum(int n){
    if(n==0){
        return 0;
    }
    return  n%10 + sum(n/10);
}
    
int count(int n){
    if(n==0){
        return 0;
    }
    return  1 + count(n/10);
}

int main(){
    int a;
    printf("Enter number\n");
    scanf("%d",&a);
    printf("sum of digits of %d is %f",a,sum(a)*1.0/count(a));
}
 