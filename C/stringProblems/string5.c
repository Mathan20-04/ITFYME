//Write a program to find string token
#include <stdio.h>
#include <string.h>
//function string token passing parameter string s1 and token -> " " or "_"  
void strtoken(char s1[],char token){ 
    int tcount=0;
    char tokenarr[100];
    int len=strlen(s1);               //gettting string length
    for(int i=0;i<len;i++){
        if(s1[i]==token){             //check characer of string with token "_"
            tokenarr[tcount]='\0';    //if condition is true place "\0" to "_"
            printf("%s\n",tokenarr); //strings are store in to token array 
            tcount=0;                //again initate with 0 because it should consider next string  
        }else{
            tokenarr[tcount]=s1[i];  //store character to token array upto one string use tcount
            tcount++;                //incrementing tcount
        }
    }
    printf("%s",tokenarr);           //printing last string

}
int main(){
    char str1[100]="computer_science_is_good_subject"; //string
    char token='_';                                    //recognize underscore in string for dividiing string
    strtoken(str1,token);                              //calling strtoken function
    
}


