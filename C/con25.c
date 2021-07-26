#include<stdio.h>
int main(int argc, char *argv[]) {
char ch;
printf("enter character\n");
scanf("%s",&ch);
if(ch>='a' && ch<='z' || ch>='A' && ch<='Z' ){
    printf("this is albhabet");
}else if(ch>='0' && ch<='9') {
    printf("this is number");
}else{
    printf("this is special character");
}   
}
