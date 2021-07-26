/* 
    Simple Hello world Program
    By ITfyMe.com 
*/
#include <stdio.h>
int main(int argc, char *argv[]) {
int a,b;
printf("enter a and b\n");
scanf("%d %d",&a,&b);
printf("Quotient value is %d\n",a/b);
printf("Remainder value is %d\n",a%b);
}