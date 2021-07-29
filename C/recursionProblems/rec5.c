//5. Given a non-negative int n, return the sum of its digits recursively
#include <stdio.h>
int sumdigit(int n) {
    if(n==0) { //base condition
        return 0;
    } 
    return n%10+sumdigit(n/10);//decompostion and composition 
}
int main() {
    int a,b;
    printf("Enter number a\n");
    scanf("%d",&a); //user input
    int res=sumdigit(a);
    printf("sum of digit = %d",res);//calling function
}
