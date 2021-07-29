//write a program to find product of each digit of number using Recursion
#include<stdio.h>
int product(int n) {
        if(n==0){
            return 1;
        }
        return  n%10 * product(n/10);
    }   

int main() {
    int a;
    printf("Enter number\n");
    scanf("%d",&a);
    printf("product of digits of %d is %d",a,product(a));
}
 