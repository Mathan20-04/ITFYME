#include<stdio.h>
int main(){
    int n,i,j,k;
    printf("Enter a number \n");
    scanf("%d",&n);
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            if(i==0||i==n-1||j==n/2||i+j==n-1||i==j){
                printf("* "); 
            }else{
                printf(" ");
            }           
        }
        printf("\n");
    }
}