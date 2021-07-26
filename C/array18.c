#include<stdio.h>
int main() {
    int n;      // size of array
    int a[10];  // array to hold the items
    int i,j;    // position 
    int temp;    // element to insert

    // populate array
    printf("Enter size less than 10\n");
    scanf("%d",&n);
    printf("Enter elements are\n");
    for(i=0;i<n;i++){
        scanf("%d",&a[i]);
    }

    // get number from user to insert
    for(i=0;i<n;i++){
        for(j=i+1;j<n;j++){
            if(a[i]==a[j]){
                temp=a[i];
                a[i]=a[j];
                a[j]=temp;
            }
        }
    }
    printf("%d",a[n-2]);
}
