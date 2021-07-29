//We have a number of bunnies and each bunny has two big floppy ears. We want to compute the total number of ears across all the bunnies recursively
#include <stdio.h>
int bunny(int n) {
    if(n==0) { //base condition
        return 0;
    }
    return 2+bunny(n-1); //decompostion and composition
}
int main() {
    int a; 
    printf("Enter number\n");
    scanf("%d",&a); //user input 
    printf("number of bunnies %d and its total number of ears %d",a,bunny(a));//calling function
}
