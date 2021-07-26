/*Write a program to accept the height of a person m and categorize the person according to their height.
 0 to 100 category dwarf; 101 to 150 category short; 151 to 165 category medium; >165 tall*/
#include <stdio.h>
int main(int argc, char *argv[]) {
int year,y;
printf("enter year\n");
scanf("%d",&year);
y=year%100;
if(y==0){
 printf("The year is century\n");
}else{
    printf("The year is not century\n");
}if(year%4==0){
    printf("The year is leap");
}else{
printf("The year is not leap");
}
}