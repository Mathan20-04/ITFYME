/* 
    Simple Hello world Program
    By ITfyMe.com 
*/

// include library
#include <stdio.h>
int main(int argc, char *argv[]) {
  int a,b;
  printf("enter a and b\n");
  scanf("%d %d",&a,&b);
  a=a+b;
  b=a-b;
  a=a-b;
  printf("after swap a=%d,b=%d\n",a,b);
}


