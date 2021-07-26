#include<stdio.h>
int sum(int n){
        if(n==0){
            return 0;
        }
        return  n%10 + sum(n/10);
    }
    

int main(){
    int a;
    printf("Enter number\n");
    scanf("%d",&a);
    printf("sum of digits of %d is %d",a,sum(a));
}
 