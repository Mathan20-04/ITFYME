#include<stdio.h>
#include<math.h>
int main(int argc,char *argv[]){
int n,fd,ld,sum;  
printf("Enter an integer\n");
scanf("%d",&n);
ld=n%10;
for(int i=0;n>=10;i++){
    n=n/10;
}
fd=n;
printf("last digit=%d\nfirst digit=%d\n",ld,fd);
sum=fd+ld;    
printf("sum of first and last digit=%d",sum);
}      
         