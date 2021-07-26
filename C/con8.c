#include <stdio.h>
int main(int argc, char *argv[]) {
    int a,b;
    printf("enter a and b\n");
    scanf("%d %d",&a,&b);
    if(a>b){
        printf("The greatest number is=%d",a);
    }else {
        printf("The greatest number is=%d",b);
    }
}