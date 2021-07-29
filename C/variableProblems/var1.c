#include<stdio.h>

int globalint=100;
char globalchar='g';
 
 int main(){
     
     int localint=10;
     long locallong=23456789;
     double localdouble=2.3;
     char localchar='A';
     char localString[20]="Learn";
     int a,b;
     //now lets print the address and the value of each variable
     printf("globalint address is %p and value is %d,%d \n",&globalint,globalint,sizeof(int));
     printf("globalchar address is %p and value is %c,%d \n",&globalchar,globalchar,sizeof(char));
     printf("====Global Variable Over====\n");
     printf("localChar address is %p and value is %c,%d \n",&localchar,localchar,sizeof(char));
     printf("localDouble address is %p and value is %lf,%d \n",&localdouble,localdouble,sizeof(double));
     printf("localLong address is %p and value is %lu,%d \n",&locallong,locallong,sizeof(long));
     printf("localInt address is %p and value is %d,%d \n",&localint,localint,sizeof(int));
     printf("localChar address is %p and value is %s,%d \n",&localString,localString,sizeof(localString));
     
     
 }