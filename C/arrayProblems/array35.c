//write a program to reverse an array
#include<stdio.h>
int main() {
    int a[6]={1,4,3,5,3,6};
    int start=0,end=5;
    int temp;
    while(start<end) {
        temp = a[start];
        a[start]=a[end];
        a[end]=temp;
        start++;
        end--;
    }
    for(int i=0;i<6;i++) {
        printf("%d ",a[i]);
    }
}