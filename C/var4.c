#include<stdio.h>
 
int main(){
     int a=2;
     signed int b=-1;
     unsigned int c=-3;
     short d=48798;
     signed short e=-384.34;
     unsigned short f=5.7657;
     float g=83948938493;
     long abc=2323;
     signed long n=9449;
     unsigned long num=943;
     double y=484;
   printf("address of a is %p ,value of a is %d and size of int datatype is %d \n",&a,a,sizeof(int));
   printf("address of b is %p,value of b is %d and size of signed int datatype is%d \n",&b,b,sizeof(signed int));
   printf("address of c is %p,,value of c is %d and size of unsigned int datatype is %d \n",&c,c,sizeof(unsigned int));
   printf("address of d is %p,value of d is %d  and size of short datatype is %d \n",&d,d,sizeof(short));
   printf("address of e is %p,value of e is %d and size of signed short datatype is %d \n",&e,e,sizeof(signed short));
   printf("address of f is %p,value of f is %d and size of  unsigned short datatype is %d  \n",&f,f,sizeof(unsigned short));
   printf("address of g is %p,value of g is  %f and size of float datatype is %d\n",&g,g,sizeof(float));
   printf("address of abc is %p,value of abc is %lu and size of long datatype is %d  \n",&abc,abc,sizeof(long));
   printf("address of n is %p,value of n is %lu and size of signed long datatype is %d  \n",&n,n,sizeof(signed long));
   printf("address of num is %p,value of num is %lu and size of  unsigned long datatype is %d \n",&num,num,sizeof(unsigned long));
   printf("address of y is %p,value of y is %lf and size of double datatype is %d \n",&y,y,sizeof(double));

 }

