#include<stdio.h>
int main() {
    int n;      //size of array
    int a[10];  //array hold the items
    int ele;    //element to insert

    //populate array
    printf("Enter size\n");
    scanf("%d",&n);
    printf("Enter elements are\n");
    for(int i=0;i<n;i++) {
        scanf("%d",&a[i]);
    }
    //get number from user to insert
    printf("Enter element\n");
    scanf("%d",&ele);
    a[n]=ele;//store element in last position
    // print result array
    printf("after inserting\n");
    for(int i=0;i<=n;i++){
    printf("%d ",a[i]);
    }

}
