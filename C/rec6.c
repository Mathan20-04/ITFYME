//Given a non-negative int n, compute recursively (no loops) the count of the occurrences
//of 8 as a digit, except that an 8 with another 8 immediately to its left counts double, so
//8818 yields 4
#include <stdio.h>
int cnt=0;
int countd(int n){
    if(n==0){ //base condition
        return 0;
    }
    if(n%10==8){
        if((n/10)%10==8){
            return 2+countd(n/10);
        }else{
            return 1+countd(n/10);
        }

    }else{
        return countd(n/10);
    }
     
}
int main() {
    int a;
    printf("Enter number a\n");
    scanf("%d",&a); //user input
    int res=countd(a);
    printf("count of digit = %d",res);//calling function
}
