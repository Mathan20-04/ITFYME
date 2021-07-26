#include<stdio.h>
int isRepeating(int a[],int n,int size,int index) {
    int res=0;
    for(int i=0;i<size;i++){
        if(i!=index){
           if(a[i]==n){ // don't check for the same
            res=1;
            break;
           }
           
        }


    }
    return res;
}

void printarray(int arr[],int size){
    for(int i=0;i<size;i++){
        printf("%d ",arr[i]);
    }
}
int main() {
    // data input
    int a[10]={22,23,24,22,21,35,65,22,21,24};

    // result
    int nr[10] ;

    // working variable
    int nrCnt=0;
    int rep ;

    for (int i=0;i<10;i++) {
        rep = isRepeating(a,a[i],10,i);
        // printf("%d",rep);
        if(rep==0){
            nr[nrCnt]=a[i];
            nrCnt++;
        }
    
    }
    printarray(nr,nrCnt);
}