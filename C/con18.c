/*Write a program to accept a coordinate point in a XY coordinate system and determine
in which quadrant the coordinate point lies.*/
#include <stdio.h>
int main(int argc, char *argv[]) {
int X,Y;
printf("enter X and Y\n");
scanf("%d %d",&X,&Y);
if(X>0 && Y>0){
    printf("I Quadrant");
}
else if(X<0 && Y>0){
    printf("II Quadrant");
}else if(X<0 && Y<0){
    printf("III Quadrant");
}else if(X>0 && Y<0){
    printf("IV Quadrant");
}
}