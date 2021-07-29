//largest contigous sub array
#include<stdio.h>
int main() {
    int a[8]={-1,-5,5,3,-2,5,4,1};
    int m=0,n=0;
    int largest=a[0];
    for(int i=0;i<8;i++){
        int sum=0;
        for(int j=i;j<8;j++){
            sum=sum+a[j];
            if(sum>largest) {
                m=i;
                n=j;
                largest=sum;
            }
            
        }

        
    }
    printf("largest contigious array\n");
    for(int k=m;k<=n;k++) {
        printf("%d ",a[k]);
    }
    printf("\n");
    printf("sum of largest contigious subarray=%d\n",largest);
   
      
}
