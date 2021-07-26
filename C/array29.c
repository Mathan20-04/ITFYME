//segregate 0's and 1's in an array
#include<stdio.h>
int main(){
    int a[10]={0,1,0,1,0,1,0,1,1}; //array elements
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
    }    
    
}