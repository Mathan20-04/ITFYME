#include<stdio.h>
int main(int argc, char *argv[]) {
char ch;
printf("enter character\n");
scanf("%s",&ch);
if(ch=='a' || ch=='e' || ch=='i' || ch=='o'||ch=='u' || ch=='A' || ch=='E' || ch=='I' || ch=='O'||ch=='U') {
    printf("this Vowels");
} else {
    printf("this is consonant");

} 
}
