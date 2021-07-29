//Write a program to   count number of digits in a number.

#include<stdio.h>
int main(int argc,char *argv[]){
    int n;
    int count=0;
    printf("enter a number\n");
    scanf("%d",&n);
    for(int i=0;n>0;i++) {
        n=n/10;
        count++;
    }
    printf("number of digits=%d\n",count);
    
}
