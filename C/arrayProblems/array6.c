#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
int main(){
    int a[5],b[5];
    for(int i=0;i<5;i++){
        a[i]=rand();
        printf("%d\n",a[i]);
    }
    printf("b elements are\n");
    for(int i=0;i<5;i++){
        b[i]=a[i];
        printf("%d\n",b[i]);        
    }
}