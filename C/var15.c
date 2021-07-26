/* 
    Simple Hello world Program
    By ITfyMe.com 
*/

// include library
#include <stdio.h>
int main(int argc, char *argv[]) {
  char a,b,c;
printf("enter a,b and c\n");
scanf("%d %d %d",&a,&b,&c);
printf("value is %d \n",a>b && a>c);
printf("value is %d \n",a>b||a>c);
printf("value is %d \n",a>b && b>c);
printf("value is %d \n",a>b||b>c);
printf("value is %d \n",a<b && a<c);
printf("value is %d \n",a<b||a<c);
printf("value is %d \n",a<b && b<c);
printf("value is %d \n",a<b||b<c);
printf("value is %d \n",a==b&&a<c);
printf("value is %d \n",a==b||a<c);
printf("value is %d \n",a==b&&b>c);
printf("value is %d \n",a==b||b>c);
printf("value is %d \n",a==b&&b==c);
printf("value is %d \n",a!=b&&b==c);
printf("value is %d \n",a!=b&&b!=c);
}

