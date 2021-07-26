
#include<stdio.h>
int main() {
    int a[5]={1,2,4,5,3};
    int n;
    printf("Enter n\n");
    scanf("%d",&n);
    for(int i=0;i<5;i++){
        if(a[i]==n){
            printf("element pivoted array is a[%d]\n",i);
        }
    }          
      

}
