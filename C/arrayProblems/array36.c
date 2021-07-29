//write a program to reverse an array
#include<stdio.h>
int main() {
    int a[6]={1,4,3,5,3,6};
    int max,min;
    for(int i=0;i<6;i++) {
        if(a[i]<min) {
            min=a[i];
        }
        printf("%d ",min);
    }
}