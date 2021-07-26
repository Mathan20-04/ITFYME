#include<stdio.h>

int main(int argc,char *argv[]){
    int n;
    float sum,average;
    int a[100];
    printf("enter number\n");
    scanf("%d",&n);
    for(int i=0;i<n;i++){
        a[i]=i+1;
        printf("%d ",a[i]);
        sum=sum+a[i];           
}
printf("\nsum=%f\n",sum);
printf("average=%f",sum/n);
}