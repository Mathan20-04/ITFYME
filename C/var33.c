/* 
    Write a program to accept five numbers through command line arguments and find the average
*/
#include<stdio.h>
int main(int argc,char *argv[]){
int a,b,c;
printf("enter a,b and c\n");
scanf("%d %d %d",&a,&b,&c);
printf("the value is %d\n",a-b-c);
printf("the value is %d\n",a-(b-c));
printf("the value is %d\n",a*b-c);
printf("the value is%d\n",a*(b-c));
printf("the value is %d\n",(a+b)*c);
printf("the value is %d\n",a/b*c);
printf("the value is %d\n",a*b/c);
printf("the value is %d\n",a+2*(b/c));
}






