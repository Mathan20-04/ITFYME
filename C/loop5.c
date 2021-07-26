//Write a program to   print all odd numbers between 1 to 100.
#include<stdio.h>

int main(int argc,char *argv[]){
 
   
    printf("odd number 1 to 100\n");

    for(int i=1;i<=100;i++){
        if(i%2!=0){
        
        printf("%d\n",i);
    }
    }
}  