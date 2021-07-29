//Write a program to find a number is perfect number or not
#include <stdio.h>
#include <math.h>
int main(int argc,char *argv[]) {
    int n,sum;
    printf("Enter a perfect\n");
    scanf("%d",&n);
    for(int i=1;i<n;i++){
        if(n%i==0){
            sum=sum+i;
        }
    }
    if(n==sum){
        printf("The number %d is perfect number",n);
    }else{
        printf("The number %d is  not perfect number",n);
    }
    
}
