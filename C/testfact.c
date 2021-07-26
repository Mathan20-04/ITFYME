#include<stdio.h>
#include "itmath.h"
int main(){
    int x;
    x=isStrong(145);
    if(x==1)
    {
        printf("strong");
    }else{
        printf("not strong");
    }
}