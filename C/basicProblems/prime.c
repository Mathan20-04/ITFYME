//Write a program to find a number is prime or not
#include<stdio.h>

int main(int argc,char *argv[]) {
    int n,flag=0;
    printf("enter the number\n");
    scanf("%d",&n);
    for(int i=2;i<=n/2;i++){
        if(n%i==0){
            printf("not prime");
            flag=1;
            break;
        }
    }
    if(flag==0) {
        printf("prime");
    }
}
