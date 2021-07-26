//Write a program to hintword
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//functiom for getting random characters between A to Z in matrix
char randchar(int r,int c,char a[r][c]){
    char A='A'; //assigning first character to A
    for(int i=0;i<r;i++){
        for(int j=0;j<c;j++){
            a[i][j]=A+rand()%26; //getting random character between A to Z in matrix
        }
    }
    for(int i=0;i<r;i++){
        for(int j=0;j<c;j++){
            printf("%c ",a[i][j]); //print matrix before  add words
        }
        printf("\n");
    }
}
int main(){
    int r=10,c=10;
    char a[r][c];
    randchar(r,c,a); //calling function
    char word[10][10]={"mathan","raghav","dixon","ranjan","prem"};//words to add in matrix
    for(int i=0;i<=10;i++){
        printf("%s ",word[i]);
        int row=rand()%10;//random row
        int col=rand()%(10-strlen(word[i])); //
        printf("row is %d and col is %d \n",row,col);
        for(int j=0;j<strlen(word[i]);j++){
            a[row][col+j]=word[i][j];
        }
    
    }
    for(int i=0;i<r;i++){
        for(int j=0;j<c;j++){
            printf("%c ",a[i][j]); //print matrix after add words
        }
        printf("\n");   
    }
}


