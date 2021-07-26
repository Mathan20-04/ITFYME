/* 
    Array Problems
    By ITfyMe.com 
*/

#include <stdio.h>  

int  main() {  
    int num = 0;
checkCond:
    
    if (num >=-20) {
        printf("%d\n",num); 
        num=num-2;
        goto checkCond;
    }else{
        return -1;
    }
    
}