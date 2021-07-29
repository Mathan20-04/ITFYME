#include<stdio.h>
int main(int argc, char *argv[]) {
    char grade;
    printf("enter a grade\n");
    scanf("%c",&grade);
    switch(grade)
    {
        case 'E':
        printf("Excellent");
        break;
        case 'V':
        printf("Very good");
        break;
        case 'G':
        printf("Good");
        break;
        case 'A':
        printf("Average");
        break;
        case 'F':
        printf("Fail");
        break;
        default:
        printf("ivalid grade");
        break;

    }
   
}
