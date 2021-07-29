#include<stdio.h>
#include<math.h>
int main(int argc,char *argv[]){
   int n,i,j,k;
   printf("enter n\n");
   scanf("%d",&n);
    for(i=0;i<=n;i++) {
        for( j=n;j>i;j--)
            printf(" ");
            for( k=0;k<i;k++)
                printf("* ");
                printf("\n");            
                  
    }
    
      
}