//Write a Program for Find a triplet that sum to a given value			
#include<stdio.h>
int main() {
    int a[8]={1,2,3,4,5,6,7,8};
    int n;    
    printf("enter a number\n");
    scanf("%d",&n);
    for(int i=0;i<=7;i++){
        for(int j=i+1;j<=7;j++){
            for(int k=j+1;k<=7;k++){
                if(a[i]+a[j]+a[k]==n) {
                    printf("%d,%d,%d\n",a[i],a[j],a[k]);
                }

            }   
            
        }
    }
}
