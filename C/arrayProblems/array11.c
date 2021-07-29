#include<stdio.h>


int main() {
    // data input
    int a[10]={1,2,3,4,5,6,7,8,9,10};
    int b[5]={1,2,3,4,5};
    // result
    

    for (int i=0;i<10;i++) {
        b[i]=a[i];
        printf("merge array %d \n",b[i]);
    }
 
}
