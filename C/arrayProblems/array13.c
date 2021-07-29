#include<stdio.h>


int main() {
    // data input
    int a[10]={1,2,3,4,5,6,7,8,9,10};
    int b[5]={11,12,13,14,15};
    int count=0;
    // result
    int c[15];
    for (int  i=0;i<10;i++) {
        c[count]=a[i];
        count++;
    }
    for (int i=0;i<5;i++){
        c[count]=b[i];
        count++;
               
    }
    for(int i=0;i<count;i++){
    printf("%d \n",c[i]);
    }

}
