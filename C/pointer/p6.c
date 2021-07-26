//Modify the program to double the number in function and return the sum;
// print the modified value of integer in the main program
//call by reference


#include<stdio.h>
#include<stdlib.h>
int dsum(int *a,int *b){
    printf("unside dsum");
    *a=*a+*a ;
    *b=*b+*b; 
    printf("\n*a=%d   *b=%d\n",*a,*b);  
   return *a + *b;
}

int main() {
    int a=10;
    int b=20;
    int (*fn)(int *,int *);
    fn=&dsum;
    int sum=fn(&a,&b);
    
    printf("unside main\n");
    printf("Sum=%d",sum);
    printf("a=%d b=%d\n",a,b);

    
}