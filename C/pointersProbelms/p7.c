//Modify the program to double the number in function and return the sum;
// print the modified value of integer in the main program
//call by value

#include<stdio.h>
#include<stdlib.h>
int dsum(int a,int b){
    a=a+a ;
    b=b+b; 
   return a + b;
}

int main() {
    int a=10;
    int b=20;
    int (*fn)(int ,int );
    fn=&dsum;
    int sum=fn(a,b);
    printf("Sum=%d\n",sum);
       
}