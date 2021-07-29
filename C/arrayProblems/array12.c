#include<stdio.h>


int main() {
    // data input
    int n,a[10]={1,2,3,4,5,6,7,8,9,10};
        // result
    int odd[5];
    int even[5];

    for (int i=0;i<10;i++) {
        if(a[i]%2==1){
            odd[i]=a[i];
            printf("odd numbers are %d \n",odd[i]);
        }
        
    }
    for (int i=0;i<10;i++) {
        if(a[i]%2!=1){
            even[i]=a[i];
            printf("even numbers are %d \n",even[i]);
        }
        
    }
   
}
