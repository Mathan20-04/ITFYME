#include <stdio.h>
int main(int argc, char *argv[]) {
    int l,b;
    printf("enter l and b\n");
    scanf("%d %d",&l,&b);
    printf("area of rectangle is=%d\n",l*b);
    if(l==b){
        printf("This is square");
    }else {
        printf("This is not square");
    }
}