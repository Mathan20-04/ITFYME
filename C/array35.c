//Write a Program for Count the number of possible triangles				
#include <stdio.h>
int main() {
    int count=0;
    int a[4]={4,6,7,3};//array
    for(int i=0;i<4;i++) {
        for(int j=i+1;j<4;j++) {
            for(int k=j+1;k<4;k++) {
                if(a[i]+a[j]>a[k] && a[i]+a[k]>a[j] && a[k]+a[j]>a[i]) {
                    count++;
                }
            }
        }
    }
    printf("number of possible triangle=%d",count);
}
