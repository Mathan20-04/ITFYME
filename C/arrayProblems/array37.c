//write a program to reverse an array
#include<stdio.h>
int main() {
    int a[11]={1,4,3,5,3,6,5,9,3,6,4};

    for(int i=0;i<11;i++) {
        for(int j=i+1;j<11;j++){
            if(a[i]==a[j]) {
                printf("%d ",a[i]);
            } 
        }
    }
    
}