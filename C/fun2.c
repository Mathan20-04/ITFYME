#include<stdio.h>
#include<math.h>
int sub(int n1,int n2 ){
    return n1-n2;
}
int main(int argc,char *argv[]) {
    int a=10;
    int b=4;
    int c=sub(a,b);
    printf("subraction of a and b=%d",c);
}      
         