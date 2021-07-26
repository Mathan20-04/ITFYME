//Given a non-negative int n, return the count of the occurrences of 7 as a digit, so for example 717 yields 2.
#include <stdio.h>
int count(int n) {
    if(n==0){ //base condition
        return 0;
    }
    if(n%10==7) { 
        return 1+count(n/10);
    }//decompostion and composition 
    return count(n/10);
}
int main() {
    int a,b;
    printf("Enter number a\n");
    scanf("%d",&a); //user input
    int res=count(a);
    printf("count = %d",res);//calling function
}
