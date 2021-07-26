#include<stdio.h>

int main(int argc,char *argv[]){
    int n;
    int a[100];
    printf("enter number\n");
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
        a[i]=i;
    printf("%d ",i);
}
}