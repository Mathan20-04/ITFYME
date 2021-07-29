#include<stdio.h>
#include<stdlib.h>
int main(){
    int a[10]={1,2,3,4,1,2,3,6,3,5};
    int numdup=0;
    for(int i=0;i<10;i++){
        for(int j=i+1;j<10;j++){
            if(a[i]!=a[j]){
                printf("dup=%d\n",a[i]);
                numdup++;
                break;
            }

        }
    }
    printf("count=%d",numdup);
    
}



// #include<stdio.h>
// struct freqcard {
//     int num;
//     int freq;
// };
// void main(int argc,char *argv[]) {
//     int n,numfreq=0;
//     printf("Enter size\n");
//     scanf("%d",&n);
//     int arr[n];
//     struct freqcard freq[n];
//     for(int i=0;i<n;i++) {
//         scanf("%d",&arr[i]);
//     }
//     for(int i=0;i<n;i++) {
//         if(numfreq==0){
//             freq[numfreq].num=arr[i];
//             freq[numfreq].freq=1;
//             numfreq++;
//         }
//         else {
//             int isNew=0;
//             for(int j=0;j<numfreq;j++) {
//                 if(arr[i]==freq[j].num) {
//                     freq[j].freq=freq[j].freq+1;
//                     isNew=1;
//                     break;
//                 }
//             }
//         }
//         for(int j=0;j<numfreq;j++) {
//             printf("num=%d freq=%d\n",freq[j].num,freq[j].freq);
//         }

//     }   

// }