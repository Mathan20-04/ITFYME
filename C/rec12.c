//Given a string, compute recursively a new string where all the 'x' chars have been removed.  removeX(“abxbc”) -> abbc
#include <stdio.h>
#include <string.h>
char countx(char a[]){
    static int i=0;
    if(a[i]=='\0') {
        return 0;
    }
    if(a[i] =='x') { //base condition
        for(int i=i;i>strlen(a);i++){
            a[i]=a[i+1];
        }
        a[i]=a[i+1];        
        return countx(a+1);
    }
    i++;
    return countx(a);  
}
int main() {
    char a[]="abxcxa";
    countx(a);
    printf("%s",a);
}
