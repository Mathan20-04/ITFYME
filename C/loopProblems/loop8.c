//Write a program to   find sum of all odd numbers between 1 to n.

#include<stdio.h>

int main(int argc,char *argv[]){
    int n;
    int sum=0;   
    printf("enter number \n");
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
       if(i%2!=0){
       sum+=i;
       }
    }
    printf("%d\n",sum);
    }