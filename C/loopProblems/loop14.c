#include<stdio.h>
#include<math.h>
int main(int argc,char *argv[]){
   int n,digit,sum=0;
   printf("Enter an integer\n");
   scanf("%d", &n);
   while(n>0){
      digit=n%10;
      sum=sum+digit;
      n=n/10;
   }
      printf("sum of digit=%d",sum);
   
}