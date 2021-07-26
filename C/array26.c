//find a missing number in series sorted array
#include<stdio.h>
int main() {
    int a[6]={2,3,4,5,7,8};
    int sum=0;
    for(int i=0;i<6;i++) {
        sum=sum+a[i];
    }
    int sumfirst=(a[0]-1)*(a[0])/2;
    int sumsecond=a[5]*(a[5]+1)/2;
    int full=sumsecond-sumfirst;
    printf("missing number is = %d",full-sum);

}