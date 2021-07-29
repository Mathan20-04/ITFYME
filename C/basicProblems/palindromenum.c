//Write a program to find a number is palindrome or not
#include <stdio.h>
#include <math.h>
int main(int argc,char *argv[]) {
    int n,sum=0,rem,temp;
    printf("Enter n\n");
    scanf("%d",&n);
    temp=n;
    while(temp>0){
        rem=temp%10;
        sum=(sum*10)+ rem;
        temp/=10;
    }
    if(sum==n)
        printf("The Number %d is Palindrome",n);
    else
        printf("The Number %d is not Palindrome",n);  
    
}
