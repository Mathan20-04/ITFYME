#include<stdio.h>
int main() {
    int n;
    int i;
    int a[10];
    int pos=1;
    int ele;
    printf("Enter size\n");
    scanf("%d",&n);
    printf("Enter elements are\n");
    for(int i=0;i<n;i++){
        scanf("%d",&a[i]);
    }
    printf("Enter element\n");
    scanf("%d",&ele);
    for(int i=n-1;i>=pos-1;i--) {
        a[i+1]=a[i];
    } 
    a[pos-1]=ele;
    printf("after inserting\n");
    for(int i=0;i<=n;i++){
    printf("%d ",a[i]);
    }

}
