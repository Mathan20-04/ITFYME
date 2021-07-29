//Given a string, compute recursively (no loops) the number of lowercase 'x' chars in the string.
//countX("xxhixx") → 4
//countX("xhixhix") → 3
//countX("hi") → 0
#include <stdio.h>

int countx(char a[]) {
    static int i=0;
    if(a[i]=='\0') {
        return 0;
    }
    if(a[i] =='x') { //base condition
        i++;
        return 1+countx(a);
    }
    i++;
    return countx(a);  
}
int main() {
    char a[]="xxmxxxx";
    int count=countx(a);
    printf("count x in the string %d",count);
}
