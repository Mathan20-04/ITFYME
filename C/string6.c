//Write a program to find string tokeniation
#include <stdio.h>
#include <string.h>
//function for sorting a string
void stringsort(char str[]){
    int len=strlen(str); //getting length of string
    int temp; 
    //swap function for sorting character
    for(int i=0;i<len-1;i++){
        for(int j=i+1;j<len;j++){
            if(str[i]>str[j]){
                temp=str[i];
                str[i]=str[j];
                str[j]=temp;
            }    
        }
    }
    printf("%s",str);   //printing string
}
int anagram(char str1[],char str2[]){
        if(strlen(str1)!=strlen(str2)){
        return 0;
        stringsort(str1);       //calling stringsort function for string 1
        stringsort(str2);       //calling stringsort function for string 2       
        if(strcmp(str1,str2)){  //comparing both string is true or not
            return 0;
        }else{
            return 1;
        }
    }
    
}
int main(){
    char str1[100]="mathan";     //string 1
    char str2[100]="mhaatn";     //string 2
    int val=anagram(str1,str2);  //calling anagram function with both string  and assign in to val
    if(val==0){
        printf("this is not anagram");
    }else{
        printf("this is anagram");
    }
    


}


