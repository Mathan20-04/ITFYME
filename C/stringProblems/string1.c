//Write a program to find length of string 
#include <stdio.h>
#include <string.h>
int strlength(char a[]){
    int len=0;
    while(a[len]!='\0'){
        len++;
    }
    return len;
}    
int main(){
    char str[100]="mathan";
    int len=strlength(str);
    printf("lenght of %d",len);

}


