//multiply two matrices using array
#include<stdio.h>
int main() {
    int a[2][2]={{2,2},{3,3}};    
    int b[2][3]={{1,2,3},{4,5,6}};
    int c[2][3]={};
    for(int i=0;i<2;i++){
        for(int j=0;j<3;j++){ 
            for(int k=0;k<2;k++){
                c[i][j]=c[i][j]+a[i][k]*b[k][j];    
            }
        }
    }
    for(int i=0;i<2;i++){
        for(int j=0;j<3;j++){
            printf("%d ",c[i][j]);
        }    
        printf("\n");
    }

}
