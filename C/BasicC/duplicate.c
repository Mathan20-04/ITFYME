#include<stdio.h>
int main() {
    int n,i,j,k,c=80;
    printf("Enter n");
    scanf("%d",&n);
    for(i=1;i<=n;i++){
        for(j=1;j<=(c/2)-i;j++){
            printf(" ");
        }
        for(k=1;k=(2*i)-1;k++){
            printf("* ");
        }
        printf("\n");
    }

}