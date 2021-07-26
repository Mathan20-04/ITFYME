/* 
    Array Problems
    By ITfyMe.com 
*/

#include <stdio.h>  

int  main() {  
    int num = 1,sum=0;
checkCond:
    
    if (num > 100) {
        printf("sum=%d",sum);
        return -1;
    }  
      if(num%2==0)
    {
        sum=sum+num;
        printf("%d\n",num); 
    }
    num=num+1;
    goto checkCond;
    
}