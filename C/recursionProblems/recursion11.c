//write a program to find number of 1's in number using Recursion
#include<stdio.h>

int count1(int n){
    if(n==0){
        return 0;
    }
    int digit = n%10;
    if(digit==1){
        return 1+count1(n/10);
    }else{
        return 0+count1(n/10);
    }
    
} 

int main(){
    int a;
    printf("Enter number\n");
    scanf("%d",&a);
    printf("count 1 in a number %d is %d",a,count1(a));
}
 
