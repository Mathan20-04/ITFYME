//Write a program to   print multiplication table of any number.

#include<stdio.h>

int main(int argc,char *argv[]){
    int n;
    printf("enter number \n");
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
    
    printf("%d x %d = %d\n",n,i,n*i);
    }
}