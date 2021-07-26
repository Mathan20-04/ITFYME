#include<stdio.h>
#include<string.h>
void reverse(char str[],int first,int last) {
  char temp;
  //base condition
  if(first==last) {
    return;           
  }
  //swapping
  temp=str[last];      
  str[last]=str[first];
  str[first]=temp;
  if(last-first==1) {
    return;
    
  }
  reverse(str,first+1,last-1);          
}
    

int main() {
  char str1[100];
  printf("Enter string\n");
  scanf("%s",&str1);
  printf("%s is string\n",str1);
  reverse(str1,0,strlen(str1)-1);
  printf("%s is string\n",str1);
    
}
 