//Write a program to call either add or subtract numbers passing two parameter using pointers (pointer to function)
#include<stdio.h>
#include<stdlib.h>
int add(int *a,int *b) {
    return *a+*b;
}
int sub(int *a,int *b) {
    return *a-*b;
}

int main() {
    int a=30,b=20;
    int op;
    char ch;
    printf("Enter char A for addition S for subtraction\n");
    ch=getchar();
    int (*fn)(int*,int*);
    if(ch=='A') {
        fn=&add;
        op=fn(&a,&b);
        printf("addition=%d",op);
        
    } else if(ch=='S') {
        fn=&sub;
        op=fn(&a,&b);
        printf("subtraction=%d",op);
    }
    
}