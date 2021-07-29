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
    printf("enter position\n");
    scanf("%d",&pos);

    // shift elements from i to i+1
    for(int i=pos-1;i<n-1;i++) {
        a[i]=a[i+1];
    } 

    // insert at postion
    // print result array
    printf("after deleting\n");
    for(int i=0;i<n-1;i++){
        printf("%d ",a[i]);
    }

}
