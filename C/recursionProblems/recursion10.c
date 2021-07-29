//write a program to find sum of digit using Recursion
#include<stdio.h>
int cnt = 0;
int sum(int n){
    if(n==0){
        return 0;
    }
    cnt++;
    return  n%10 + sum(n/10);
}
int main(){
    int a;
    printf("Enter number\n");
    scanf("%d",&a);
    printf("sum of digits of %d is %f",a,sum(a)*1.0/cnt);
}
 