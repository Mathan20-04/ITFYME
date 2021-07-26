#include<stdio.h>
int main() {
    int n;      // size of array
    int a[10];  // array to hold the items
    int pos;    // position 
    int ele;    // element to insert

    // populate array
    printf("Enter size less than 10\n");
    scanf("%d",&n);
    printf("Enter elements are\n");
    for(int i=0;i<n;i++){
        scanf("%d",&a[i]);
    }

    // get number from user to insert
    printf("Enter element\n");
    scanf("%d",&ele);
    printf("enter position\n");
    scanf("%d",&pos);

    // shift elements from i to i+1
    for(int i=n-1;i>=pos-1;i--) {
        a[i+1]=a[i];
    } 

    // insert at postion
    a[pos-1]=ele;

    // print result array
    printf("after inserting\n");
    for(int i=0;i<=n;i++){
        printf("%d ",a[i]);
    }

}
