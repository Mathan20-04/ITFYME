#include<stdio.h>
int main() {
    int a[7]={1,4,2,5,6,3,7};
    int n;    
    printf("enter a number\n");
    scanf("%d",&n);
    for(int i=0;i<7;i++){
        for(int j=i+1;j<7;j++){
            if(a[i]+a[j]==n) {
                printf("%d,%d\n",a[i],a[j]);
            }              
        }
    }
}
