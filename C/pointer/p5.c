//Modify the program to pass two integer pointers to function and return the sum

#include<stdio.h>
#include<stdlib.h>
int add(int a,int b){
    return a+b;
}

int main() {
    int (*fn)(int,int);
    fn=&add;
    int sum=fn(5,6);
    printf("sum=%d",sum) ;
}