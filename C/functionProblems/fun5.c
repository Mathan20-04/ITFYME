#include<stdio.h>
#include<math.h>
void printarr(int a[],int size) {
    for(int i=0;i<size;i++){
        printf("%d ",a[i]);
    }
}
int isprime(int n){
    int prime=0;
    for(int i=2;i<n/2;i++){
        if(n%i==0){
            prime=1;
            break;
        }
    }
    return prime;
}
int main(int argc,char *argv[]) {
    int arr[]={1,2,3,44,5,6};
    int a;
    printarr(arr,6);
    printf("%d is %s\n", a, isprime(a) == 1 ? " not prime " : " prime ");
    for (int i =0; i<6;i++) {
        printf("%d is %s\n", arr[i], isprime(arr[i]) == 1 ? " not prime " : " prime ");
    }
}
