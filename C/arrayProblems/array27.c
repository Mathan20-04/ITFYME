#include<stdio.h>
int main() {
    int a[3][3]={{1,2,3},{3,4,3},{2,3,1}};    
    int b[3][3]={{1,2,3},{4,5,6},{3,5,2}};
    int c[3][3]={};
    int transpose[3][3]={};
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){ 
            for(int k=0;k<3;k++){
                c[i][j]+=a[i][k]*b[k][j];     
            }
        }
    }
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            printf("%d ",c[i][j]);
        }    
        printf("\n");
    }
    printf("\n");
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            transpose[i][j]=c[i][j];
        }
    }    
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            printf("%d ",transpose[j][i]);             
        }
        printf("\n");
    }   
    return 0;

}
