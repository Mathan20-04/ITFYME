//maximum sub array of product
#include<stdio.h>
int main() {
    int a[8]={1,5,-5,-3,2,5,4,1};//array
    int m=0,n=0;//index
    int largest=a[0];//consider first element as largest 
    for(int i=0;i<8;i++){
        int product=1;//initially product 
        for(int j=i;j<8;j++){
            product=product*a[j];
            if(product>largest) {
                m=i;//index
                n=j;//index
                largest=product;//store product into largest
            }
            
        }

        
    }
    printf("maximum product subarray\n");
    for(int k=m;k<=n;k++) {
        printf("%d ",a[k]);//sub array
    }
    printf("\n");
    printf("product of largest contigious subarray=%d\n",largest);//product of largest subarray
    return 1;
         
}
