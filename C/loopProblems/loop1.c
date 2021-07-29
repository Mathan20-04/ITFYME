//Write a program to   print all natural numbers from 1 to n

#include<stdio.h>

int main(int argc,char *argv[]){
    int n;
    printf("enter the number\n");
    scanf("%d",&n);
    printf("natural numbers 1 to %d \n",n);

    for(int i=1;i<=n;i++){
        printf("%d\n",i);
    }

}
