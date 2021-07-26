//16. Given a string, compute recursively a new string where all the adjacent chars
//are now separated by a &quot;*&quot;.
//a. “hello” -&gt; “h*e*l*l*o”
#include <stdio.h>
#include <string.h>
char countx(char a[]){
    static int i=0;
    if(a[i]=='\0') {
        return 0;
    }
    return countx(a+1);
    
}
int main() {
    char a[]="abxa";
    countx(a);
    printf("%s",a);
}
