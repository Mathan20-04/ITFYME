/*Write a program to accept the height of a person m and categorize the person according to their height.
 0 to 100 category dwarf; 101 to 150 category short; 151 to 165 category medium; >165 tall*/
#include <stdio.h>
int main(int argc, char *argv[]) {
int a;
printf("enter height\n");
scanf("%d",&a);
if(a>0 && a<100){
    printf("height %d is dwarf",a);
}
else if(a>101 && a<150){
    printf("height %d is short",a);
}
else if(a>151 && a<165){
    printf("height %d is medium",a);
}
else{
    printf("height %d is tall",a);
}
}