#include<stdio.h>
#include<math.h>
float div(int n1,int n2) {
    return n1/n2;
}
int main(int argc,char *argv[]) {
    int a=20;
    int b=10;
    float c=div(a,b);
    printf("division of a and b=%f",c);
}      
         