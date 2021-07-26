#include<stdio.h>
int main(int argc, char *argv[]) {
int a,b,c;
printf("Enter a,b and c\n");
scanf("%d %d %d",&a,&b,&c);
if(a==b && b==c){
    printf("The triangle is Equilateral");
}else if(a==b || a==c || a==c){
    printf("The triangle is isosceles");
}
else if(a!=b && b!=c){
    printf("The triangle is scalene");
}
}