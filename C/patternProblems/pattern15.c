#include<stdio.h>
int main() {
    int n,k=1,m=1;
    printf("Enter a number \n");
    scanf("%d",&n);
            printf("\n");

    for(int i=1;i<=n;i++){
        for(int j=1;j<=i;j++){
            printf("%d ",i);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=i;j++){
            printf("%d ",j);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=i;j++){
            printf("%d ",j);
        }
        printf("\n");
    }
    for(int i=n-1;i>=1;i--){
        for(int j=1;j<=i;j++){
            printf("%d ",j);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=i;j++){
            printf("%d ",j%2);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=i;j++){
            printf("%d ",i%2);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=i;j++){
            printf("%d ",j%2);
        }
        printf("\n");
    }
    for(int i=n-1;i>=1;i--){
        for(int j=1;j<=i;j++){
            printf("%d ",j%2);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=i;j++){
            printf("%d ",k++);
        }
        printf("\n");
    }
    for(int i=n-1;i>=1;i--){
        for(int j=1;j<=i;j++){
            printf("%d ",k++);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=i;j++){
            printf("%d ",m++);
        }
        printf("\n");
    }

    
}