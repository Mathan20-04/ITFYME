//Write a program to find string comparision
#include <stdio.h>
#include <string.h>
int strcomp(char a[],char b[]){
    int count=0;
    int cmp=0;
    while(a[count]!='\0' || b[count]!='\0'){
        if(a[count]!=b[count]){
            cmp=1;
            break;
        }
        count++;
    }
    return cmp;
}
int main() {
    char str1[]="mathan";
    char str2[]="mathn";
    int cmp = strcomp(str1,str2);  
    if(cmp==0){
        printf("equal string");
    }else{
        printf("not equal string");
    } 
}


