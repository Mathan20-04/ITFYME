/*Write a program to calculate the root of a Quadratic Equation (take input a, b, c)*/
#include <stdio.h>
#include<math.h>
int main(int argc, char *argv[]) {
int rollno,m1,m2,m3,total,percentage;
char name[20];
printf("enter roll number\n");
scanf("%d",&rollno);
printf("enter name\n");
scanf("%s",&name);
printf("name:%s\n",name);
printf("Enter marks\n");
scanf("%d %d %d",&m1,&m2,&m3);
total=m1+m2+m3;
printf("total marks=%d\n",total);
percentage=total/3;
printf("percentage of marks=%d\n",percentage);
}