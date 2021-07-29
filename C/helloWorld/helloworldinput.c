/*
Simple Hello world program
By Itfyme.com
*/
// include library
#include<stdio.h>
int main(int argc,char *argv[]){
    char name[128];//place holder to keep the name
    printf("please enter your name  \n");    
    scanf("%s", name); //system call which accepts the name and stores in var;
    printf("hello %s ! welcome to programming world \n",name);
}