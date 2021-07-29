#include<stdio.h>
enum week{sun=11,mon=12,tue=13,wed=12,thu=15,fri=16,sat=17};//assining names to the integral constant
enum day{sund,mond,tues,wedn,thur=8,frid,satu};//without assining name to the integral constant 
int main() {
    printf("The value of enum week: %d %d %d %d %d %d %d\n\n",sun,mon,tue,wed,thu,fri,sat);
    printf("The default value of enum week: %d %d %d %d %d %d %d\n\n",sund,mond,tues,wedn,thur,frid,satu); //it will give you a default values
}