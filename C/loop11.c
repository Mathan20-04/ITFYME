#include<stdio.h>
#include<math.h>
int main(int argc,char *argv[]){
int n,fd,ld,mul=1,res=0,digit;  
printf("Enter an integer\n");
scanf("%d",&n);
ld=n%10;
while(n>=10){
    n=n/10;
}
fd=n;
printf("last digit=%d\nfirst digit=%d",ld,fd);
 
    
}      
         