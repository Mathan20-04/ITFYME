//Given a string, compute recursively (no loops) a new string where all appearances of "pi" have been replaced by "3.14".
//changePi("xpix") → "x3.14x"
//changePi("pipi") → "3.143.14"
//changePi("pip") → "3.14p"
#include <stdio.h>
#include <string.h>
char countx(char a[]) {
    static int i=0;
    if(a[i]=='\0') {
        return 0;
    }
    if(a[i] =='p' && a[i+1]=='i') { //base condition
        for(int j=strlen(a);j>=i+2;j--) {
            a[j+2]=a[j];
        }
        a[i]='3';
        a[i+1]='.';
        a[i+2]='1';
        a[i+3]='4';
        return countx(a+1);
    }
    i++;
    return countx(a);  
}
int main() {
    char a[]="xpixpipi";
    countx(a);
    printf("%s",a);
}
