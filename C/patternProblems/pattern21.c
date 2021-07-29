#include <stdio.h>
int main() {
    int n,m,p;
    printf("Enter n\n");
    scanf("%d",&n);
    m=n;
    p=1;
    for(int i=1;i<=n;i++) {
        for(int j=1;j<=m-1;j++) {
            printf("  ");
        }
        for(int k=1;k<=2*i-1;k++) {
            printf("* ");
        }
        m--;
        printf("\n");
    }
    for(int i=n-1;i>=1;i--) {
        for(int j=1;j<=p;j++) {
            printf("  ");
        }
        for(int k=1;k<=2*i-1;k++) {
            printf("* ");
        }
        p++;
        printf("\n");
    }
} 