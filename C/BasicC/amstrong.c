//Write a program to find a number is amstrong or not

#include <stdio.h>
#include <math.h>
int main(int argc,char *argv[]) {
    int n,sum=0,rem,count=0;
    printf("enter the number\n");
    scanf("%d",&n);
    int temp=n;
    int num=n;
    while(num>0){
        int digit=num%10;
        count=count+1;
        num=num/10;
    }
    while(temp>0) {
        rem=temp%10;
        sum=sum+pow(rem,count);
        temp=temp/10;
    }
    if(n==sum) {
        printf("Amstrong number");
    } else {
        printf("not Amstrong number");
    }

}
