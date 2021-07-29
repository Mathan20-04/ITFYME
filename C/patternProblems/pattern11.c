#include<stdio.h>
int main() {
    int n,i,j,k;
    printf("Enter a number \n");
    scanf("%d",&n);
    printf("\n");
    for(i=1;i<=n;i++){
        for(j=1;j<=n;j++){
            printf("%d",i);
        }
        printf("\n");
    }
    printf("\n");
    for(i=1;i<=n;i++){
        for(j=1;j<=n;j++){
            printf("%d",j);
        }
        printf("\n");
    }
    
}