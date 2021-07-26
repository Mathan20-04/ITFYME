#include <stdio.h>

void printArray(int a[], int size) {
    for (int i =0; i<size;i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

void merge(int a[], int left, int mid, int right) {
    int l,r,m ; // current index for the left, right and merged array 
    int leftSize = mid - left + 1 ;
    int rightSize = right - mid ;

    printf("left = %d mid = %d right = %d \n", left, mid, right) ;
    printf("left size = %d  right size = %d \n", leftSize,  rightSize) ;
    int la[leftSize] , ra[rightSize] ; // two temporary array to store the data to merge back to array a

    for (int i = 0; i < leftSize ; i++) {
        la[i] = a[left+i];
    }

    for (int i = 0 ; i < rightSize ; i++) {
        ra[i] = a[mid+1+i] ;
    }
    // current index of left, right and merged arrays
    l = r =  0;
    m = left;
    while (l < leftSize && r < rightSize) {
        if (la[l] < ra[r])
            a[m++] = la[l++] ;
        else
            a[m++] = ra[r++] ;
    }
    
    // copy the remaining element
    while (l < leftSize) {
        a[m++] = la[l++] ; 
    }
    while (r < rightSize) {
        a[m++] = ra[r++] ; 
    }  
}

void mergeSort(int a[], int left, int right) {
    printf("l %d r %d \n", left, right) ;
    if (left < right) {
        // divide the array into two halves
        int mid = (left+right)/2;
        // left
        printf("left merge sort %d %d \n", left, mid);
        mergeSort(a, left, mid) ;
        // right
        printf("right merge sort %d %d \n", mid+1,right);
        mergeSort(a, mid+1, right) ;
        // merge now the left and right
        merge(a, left, mid , right) ;

    }
}


int main() {
    int a[10] = {8,5,2,4} ;
    printArray(a,4) ;
    mergeSort(a,0,3);
    printArray(a,4);
}