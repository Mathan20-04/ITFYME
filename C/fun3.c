#include<stdio.h>
#include<math.h>
int mul(int n1,int n2) {
    return n1*n2;
}
int main(int argc,char *argv[]) {
    int a=10;
    int b=4;
    int c=mul(a,b);
    printf("multiplication of a and b=%d",c);
}      
         