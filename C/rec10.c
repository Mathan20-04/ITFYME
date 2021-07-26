//Given a string, compute recursively (no loops) a new string where all the lowercase 'x' chars have been changed to 'y' chars.
//changeXY("codex") → "codey"
//changeXY("xxhixx") → "yyhiyy"
//changeXY("xhixhix") → "yhiyhiy"

#include <stdio.h>
#include <string.h>
char countx(char a[]){
    static int i=0;
    if(a[i]=='\0') {
        return 0;
    }
    if(a[i] =='x') { //base condition
        a[i]='y';
        return countx(a+1);
    }
    i++;
    return countx(a);  
}
int main() {
    char a[]="xxmxxxx";
    countx(a);
    printf("%s",a);
}
