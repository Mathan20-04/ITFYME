/*Write a program to calculate the root of a Quadratic Equation (take input a, b, c)*/
#include <stdio.h>
#include<math.h>
int main(int argc, char *argv[]) {
int a,b,c,exp;
float sqroot,root1,root2;
printf("enter a,b,c\n");
scanf("%d %d %d",&a,&b,&c);
exp=(b*b)-(4*a*c);//b^2-4ac
sqroot=sqrt(exp);//sqroot of b^2-4ac
root1=(-b+sqroot)/(2*a);//[-b+(sqroot of b^2-4ac)]/(2*a)
root2=(-b-sqroot)/(2*a);//[-b-(sqroot of b^2-4ac)]/(2*a)
printf( "sqrt value1 =%f\n",root1);
printf( "sqrt value2 =%f\n",root2);
}