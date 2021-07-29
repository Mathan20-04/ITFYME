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
  printf("value of a is %d and size of int datatype is %d \n",a,sizeof(int));
  printf("value of b is %d and size of signed int datatype is%d \n",b,sizeof(signed int));
  printf("value of c is %d and size of unsigned int datatype is %d \n",c,sizeof(unsigned int));
  printf("value of d is %d  and size of short datatype is %d \n",d,sizeof(short));
  printf("value of e is %d and size of signed short datatype is %d \n",e,sizeof(signed short));
  printf("value of f is %d and size of  unsigned short datatype is %d  \n",f,sizeof(unsigned short));
  printf("value of g is  %f and size of float datatype is %d\n",g,sizeof(float));
  printf("value of abc is %lu and size of long datatype is %d  \n",abc,sizeof(long));
  printf("value of n is %lu and size of signed long datatype is %d  \n",n,sizeof(signed long));
  printf("value of num is %lu and size of  unsigned long datatype is %d \n",num,sizeof(unsigned long));
  printf("value of y is %lf and size of double datatype is %d \n",y,sizeof(double));


}

