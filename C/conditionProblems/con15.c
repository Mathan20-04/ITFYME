/*Write a program to accept the height of a person m and categorize the person according to their height.
 0 to 100 category dwarf; 101 to 150 category short; 151 to 165 category medium; >165 tall*/
#include <stdio.h>
int main(int argc, char *argv[]) {
float attendclass,totalclass;
float per;
printf("enter attend and total class\n");
scanf("%d %d",&attendclass,&totalclass);
per=(attendclass/totalclass)*100;
printf("percentage of attend class %f\n",per);
if(per>=75){
    printf("student can write exams");
}else{
    printf("student can not write exams ");
}
}