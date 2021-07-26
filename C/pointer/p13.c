//Write a program to find length of string
#include <stdio.h>
#include <stdlib.h>
int strlen(char *str[])
{
  int len = 0;

  while (str[len] != '\0')
    len++;
    return len;
}    
int main() {
    char str[20];
    int length;
    printf("enter string");
    gets(str);
    int (*fn)(char *)
    fn=strlen(&str);

}