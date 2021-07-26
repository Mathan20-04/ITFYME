//Given base and n that are both 1 or more, compute recursively base raise to n
#include <stdio.h>
int power(int n,int pow) {
    if(n==0) {
        return 0;
    }
    if(pow==0) { //base condition
        return 1;
    }
    return n*power(n,pow-1);
}
int main() {
    int n,pow;
    printf("Enter base\n");
    scanf("%d",&n); //user input
    printf("Enter power\n");
    scanf("%d",&pow);
    int res=power(n,pow);
    printf("%d power of %d is %d",n,pow,res);//calling function
}
