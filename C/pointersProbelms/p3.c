#include<stdio.h>
#include<stdlib.h>

int main(int argc,char *argv[]) {
    int *pc;
    int *pm;
    int a;
    pc=(int*) calloc(1,sizeof(int)); 
    pm=(int*) malloc(sizeof(int));
    *pc=10;
    *pm=20;
    a=*pc+*pm;

    printf("address of pc=%p and value of pc:%p and its content %d \n",&pc,pc,*pc);  
    printf("address of pm=%p and value of pm:%p and its content %d \n",&pm,pm,*pm);     
    printf("address of a=%p and value of a:%d",&a,a); 
}