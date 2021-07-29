//Write a program to   print all even numbers between 1 to 100.
#include<stdio.h>

int main(int argc,char *argv[]){
 
   
    printf("even number 1 to 100\n");

    for(int i=1;i<=100;i++){
        if(i%2==0){
        
        printf("%d\n",i);
    }
    }
}  