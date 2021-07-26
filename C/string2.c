//Write a program to find string copy another string
#include <stdio.h>
#include <string.h>
void strcopy(char a[],char b[]) { 
    int len=0;
    while(a[len]!='\0'){
        b[len]=a[len];
        len++;
    }

}
int main() {

    char str[100]="mathan";
    char str1[100];
    strcopy(str,str1);
    printf("%s",str1);

}


