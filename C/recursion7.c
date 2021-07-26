#include<stdio.h>
  int count(int n){
        if(n==0){
            return 0;
        }
        return 1+count(n/10);
    }
    

int main(){
    int a;
    printf("Enter number\n");
    scanf("%d",&a);
    printf("count of %d is %d",a,count(a));
}
 