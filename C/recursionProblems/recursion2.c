//write a program to check string is palindrome or not using Recursion
#include<stdio.h>
#include<string.h>
int ispalindrome(char str[],int first,int last) {
    if(first==last) {
        return 1;
    }
    if(last-first==1) {
        return str[first]==str[last];      
    }           
    int same=(str[first]==str[last]) && ispalindrome(str,first+1,last-1); 
    return same;        
} 
int main() {
    char str1[100];
    printf("Enter string\n");
    scanf("%s",&str1);
    int ispal=ispalindrome(str1,0,strlen(str1)-1);
    printf("%s is %s\n",str1,ispal==1?"palindrome":"not palindrome");
}
 