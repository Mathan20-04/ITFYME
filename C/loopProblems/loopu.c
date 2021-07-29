/* 
    Array Problems
    By ITfyMe.com 
*/

#include <stdio.h>  

int  main() {  
    int num = 1 ;
checkCond:
    
    if (num > 100) {
        return -1;
    }  
      if(num%2!=0)
    {
        printf("%d\n",num); 
    }
    num=num+1;
    goto checkCond;
    
}