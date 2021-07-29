#include<stdio.h>
int main() {
    int a[12]={1,4,5,5,6,5,4,4,4,5,5,3};
    int maxfreq=1;
    int i,maxelement;
    int count=0;
    for(int i=0;i<12;i++) {
        int maxelement=a[i];
        for(int j=i+1;j<12;j++) {
            if(a[i]==a[j]) {
                count++;
            }
        }
        if(count>maxfreq) {
            maxfreq=count;
            maxelement=i;
            printf("%d ",count);                                 
        }   
         
    }       
}
