/*Write a program to accept the height of a person m and categorize the person according to their height.
 0 to 100 category dwarf; 101 to 150 category short; 151 to 165 category medium; >165 tall*/
#include <stdio.h>
int main(int argc, char *argv[]) {
int age;
printf("enter age\n");
scanf("%d",&age);
if(age>=18){
 printf("candidate eligible his/him casting for own vote and age is %d\n",age);
}else{
    printf("candidate not eligible his/him casting for own vote and age is %d\n",age);
}
}