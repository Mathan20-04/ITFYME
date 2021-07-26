/* 
A shop will give discount of 10% if the cost of purchased quantity is more than 1000.
 Ask user for quantity ; Suppose, one unit will cost 100. Judge and print total cost for user.
*/
#include <stdio.h>
int main(int argc, char *argv[]) {
    int amount,total,discount,n;
    printf("enter quantity\n");
    scanf("%d",&n);
    amount=n*100;
    if(amount>=1000) {
        discount=amount*0.1;
        total=amount-discount;;
        printf("after discount total amount=%d",total);
    } else {
        printf("the amount is=%d",amount);
    }

}