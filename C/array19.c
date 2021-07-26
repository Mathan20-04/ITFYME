#include<stdio.h>
int main() {
    int n;      // size of array
    printf("Enter a number\n");
    scanf("%d",&n);
    printf("\n");
    int a[n];  // array to hold the items   
    for(int i=0;i<n;i++) {
        scanf("%d",&a[i]);
    }
    int i,j,temp;    // position
    for(i=0;i<n;i++){
        for(j=i+1;j<n;j++){
            if(a[i]>a[j]){
               temp=a[i]; //swapping
               a[i]=a[j];
               a[j]=temp;
            }
        }
    }
    printf("sorted array");
    for(i=0;i<n;i++){
        printf("%d ",a[i]);
    }
    printf("\nsecond largest=%d\n",a[n-2]);
    printf("second smallest=%d\n",a[1]);

}
