#include<stdio.h>

int main(int argc,char *argv[]){
    int n,sum;
    int a[100];
    printf("enter number\n");
    scanf("%d",&n);
    for(int i=0;i<n;i++){
        a[i]=i+1;
        sum=sum+a[i];           
}
printf("sum=%d",sum);
}