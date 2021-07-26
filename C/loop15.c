#include<stdio.h>
#include<math.h>
int main(int argc,char *argv[]){
   int n,digit,product=1;
   printf("Enter an integer\n");
   scanf("%d", &n);
   while(n>0){
      digit=n%10;
      product=product*digit;
      n=n/10;
   }
      printf("product of digit=%d",product);
   
}