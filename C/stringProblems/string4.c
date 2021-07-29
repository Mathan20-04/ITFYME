//Write a program to find string concatenation
#include <stdio.h>
#include <string.h>
void strcon(char s1[],char s2[]){
    int count=0;
    int cmp=0;
    while(s1[count]!='\0'){
        count++;
    }
    while(s2[cmp]!='\0'){
        s1[count+cmp]=s2[cmp];
        cmp++;        
    }
    printf("%s",s1);

}
int main(){
    char str1[100]="computer ";
    char str2[100]="science";
    strcon(str1,str2);
    
}


