//We have triangle made of blocks. The topmost row has 1 block, the next row down has 2
//blocks, the next row has 3 blocks, and so on. Compute recursively (no loops or
//multiplication) the total number of blocks in such a triangle with the given number of
//rows.
//a. triangle(0) → 0
//b. triangle(1) → 1
//c. triangle(2) → 3
#include <stdio.h>
int triangle(int n){
    if(n==0){ //base condition
        return 0;
    }
    return n+triangle(n-1);//decompostion and composition 
}

int main() {
    int a,b;
    printf("Enter number a\n");
    scanf("%d",&a); //user input
    int res=triangle(a);
    printf("ears of bunny = %d",res);//calling function
}
