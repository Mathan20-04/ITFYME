#include<stdio.h>
#include<math.h>
int main(int argc,char *argv[]){
   int n,fd=n%2,ld,mul=1,res=0,digit;
   printf("Enter an integer\n");
   scanf("%d", &n);
   while(n>10){
      digit=n%10;
      if(mul>1){
         res=res+digit*mul;
      }
      n=n/10;
      mul=mul*10;
   }
   printf("res=%d",fd*mul+res+n);
}