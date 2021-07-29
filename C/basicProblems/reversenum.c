//Write a program to find a reverse number of a number
#include <stdio.h>
#include <math.h>
int main(int argc,char *argv[]) {
    int n,sum=0,rem;
    printf("Enter n\n");
    scanf("%d",&n);
    printf("The numbere is %d\n",n);
    while(n>0){
        rem=n%10;
        sum=(sum*10)+ rem;
        n/=10;
    }
    printf("The reverse number is %d",sum);

}
