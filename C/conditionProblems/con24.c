#include<stdio.h>
int main(int argc, char *argv[]) {
int a,b,c,sum;
printf("Enter a,b and c\n");
scanf("%d %d %d",&a,&b,&c);
sum=a+b+c;
if(sum==180){
    printf("This is  triangle");
}else{
    printf("This is not triangle");
}
}