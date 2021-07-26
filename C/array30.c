//Leader elements in an array
#include<stdio.h>
int main(){
    int n,a[n];
    printf("Enter number\n");
    scanf("%d",&n);
    for(int i=0;i<n;i++) {
        scanf("%d",&a[i]);
    }
     //array elements
    for(int i=0;i<n;i++) {
        for(int j=i+1;j<n;j++) {
            if(a[i]<a[j]) {  //compare each elements in array
                i=j; //store j value to i
            }              
        }
        printf("%d ",a[i]); //print leader elements in a[] 
        
    }
    return 0;    
}