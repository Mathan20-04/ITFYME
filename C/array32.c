//maximum sub array of product
#include<stdio.h>
int main() {
    int a[8]={1,2,6,8,9,10,11};//array
    int b[5]={7,8,9,10,11};
    int c[4]={};
    int d[3]={};
    int count=0;
    for(int i=0;i<8;i++) {
        for(int j=0;j<5;j++) {
            if(a[i]==b[j]) {
                c[count]=a[i];
                count++;

            }
        }                
    }
    printf("intersection\n");
    for(int i=0;i<4;i++) {
        printf("%d ",c[i]);
    }
    for(int i=0;i<8;i++){
        for(int j=0;j<5;j++) {
            if(a[i]==b[j]){
                a[i]=b[j];                
            }
        }
    }


    return 0;
}    


/*int a[10]={0,1,0,1,0,1,0,1,1}; //array elements
    int c[10]={}; //output c[] array
    int count=0; //count
    for (int  i=0;i<10;i++) {
        if(a[i]==0){ //compare each element is 0's  or not
            c[count]=a[i]; //0's element store in c[] array
            count++;
        }
    }
    for (int i=0;i<10;i++){
        if(a[i]!=0){ //compare each element is 1's or not
            c[count]=a[i]; //1's element store in c[] array
            count++;
        }       
    }
    for(int i=0;i<count;i++){
    printf("%d ",c[i]); //print segregate 0's and 1's in array
    }*/

