#include <stdio.h>
int main() {
    int n;
    printf("Enter n\n");
    scanf("%d",&n);
    for(int i=n;i>=1;i--) {
        for(int j=1;j<=i-1;j++) {
            printf(" ");
        }
        for(int k=1;k<=n;k++) {
            printf("* ");
        }
        printf("\n");
    }
}