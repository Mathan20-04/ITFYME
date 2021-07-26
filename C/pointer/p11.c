//Write a program to find the factorial of a given number using pointers
#include<stdio.h>
#include<stdlib.h>
int fact(int *a){
    int fact=1;
    for(int i=1;i<=*a;i++){
        fact*=i;
    }
    return fact;
}
int main() {
    int a;
    printf("enter a \n");
    scanf("%d",&a);
    int (*fn)(int *);
    fn=&fact;
    int fact=fn(&a); 
    printf("factorial of %d is %d",a,fact);
 
}