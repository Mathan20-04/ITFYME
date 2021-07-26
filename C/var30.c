/* 
    Write a program to accept five numbers through command line arguments and find the average
*/
#include <stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[]) {
int a,b,c,d,e,average;
a=atoi(argv[1]);
b=atoi(argv[2]);
c=atoi(argv[3]);
d=atoi(argv[4]);
e=atoi(argv[5]);
average=(a+b+c+d+e)/5;
printf("The average of number = %d",average);
return 0;
}
