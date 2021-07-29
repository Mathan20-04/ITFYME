//Write a program to   print all natural numbers in reverse (from n to 1)

#include<stdio.h>

int main(int argc,char *argv[]){
    int n;
    printf("enter the number\n");
    scanf("%d",&n);
    printf("enter the number 1 to %d \n",n);

    for(int i=n;i>=1;i--){
        printf("%d\n",i);
    }

}

