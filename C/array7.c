#include <stdio.h>
#include <stdlib.h>
int main(){
    int n,arr[5];
    int ispresent=0;
    printf("enter number\n");
    scanf("%d",&n);
    for (int i = 0; i < 5; i++)
    {
        arr[i]=rand();
        printf("%d\n",arr[i]);
    }
    for(int i=0;i<5;i++){
        if(arr[i]==n)
        {
            ispresent=1;
            
            break;
        }

    }
    if(ispresent==1){
        printf("the number is present");
    }else{
        printf("the number is not present");
    }
    

}