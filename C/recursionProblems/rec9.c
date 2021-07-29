//Given a string, compute recursively (no loops) the number of times lowercase "hi" appears in the string.
//countHi("xxhixx") → 1
//countHi("xhixhix") → 2
//countHi("hi") → 1

#include <stdio.h>
int countx(char a[]) {
    static int i=0;
    if(a[i]=='\0') {
        return 0;
    }
    if(a[i] =='h' && a[i+1]=='i') { //base condition
        i++;
        return 1+countx(a);        
    }
    i++;
    return countx(a);  
}
int main() {
    char a[]="xxhixxhixhix";
    int count=countx(a);
    printf("count hi in the string %d",count);
}
