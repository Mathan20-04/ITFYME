#include <stdio.h>
int main(int argc, char *argv[]) {
    int year;
    printf("enter year\n");
    scanf("%d",&year);
    if(year%4==0) {
        printf("The year is leap");
    } else {
        printf("The year is not leap");
    }
}