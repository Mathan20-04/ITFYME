#include<stdio.h>
int main() {
    int a[7]={1,2,6,8,9,10,11};//array
    int odd=0,even=0;
    printf("odd index elements\n");
    for(int i=0;i<7;i++) {
        i=i+1;
        printf("%d ",a[i]);
        odd+=a[i]; 
    }  
    printf("\n");   
    printf("sum of odd=%d\n",odd);
    printf("even index elements\n");
    for(int j=-1;j<7;j++) {
        j=j+1;        
        printf("%d ",a[j]);
        even+=a[j];  
          
    }
    printf("\n");
    printf("sum of even=%d\n",even);
    if(odd<even){
        printf("max=%d",even);
    }else{
        printf("max=%d",odd);
    }
    



}    


