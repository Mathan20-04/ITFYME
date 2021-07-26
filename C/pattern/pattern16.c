#include<stdio.h>
int main() {
    int n,i,j,k,c=20,m=1;
    printf("Enter n \n");
    scanf("%d",&n);
    for(i=1;i<n;i++){
        for(j=0;j<=(c/2)-i;j++){
            printf("  ");
        }
        for(k=0;k<(2*i)-1;k++){
            printf("* ");
        }
        printf("\n");
    }

}