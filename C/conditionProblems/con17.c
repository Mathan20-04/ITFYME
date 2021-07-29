/*Write a program to find the largest of three numbers*/
#include <stdio.h>
int main(int argc, char *argv[]) {
int a,b,c,age;
printf("enter a,b and c\n");
scanf("%d %d %d",&a,&b,&c);
if(a>b && a>c){
    printf("a=%d is largest",a);
}
else if(b>a && b>c){
    printf("b=%d is largest",b);
}
else {
    printf("c=%d is largest",c);
}
}