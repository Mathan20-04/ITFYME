//maximum sub array of product
#include<stdio.h>
int main() {
    int a[8]={2, 3, 10, 6, 23, 8, 1};//array
    int sub,max=1;
    for(int i=0;i<8;i++) {
        for(int j=i+1;j<8;j++) {
            sub=a[j]-a[i];  
            printf("%d ",sub);          
            if(max<sub){
                max=sub;
            }
        }
    }
    printf("\nmaximum number of sub %d",max);
}
