/* 
    Simple Hello world Program
    By ITfyMe.com 
*/

// include library
#include <stdio.h>

int main(int argc, char *argv[]) {
    short a;
    unsigned short int b  ;
    signed short c ;
    printf("enter three  short number seperated by spaces \n");
    scanf("%hd %hd %hd", &a, &b, &c);
    printf("value is %hd and size is %lu \n", a, sizeof(short));
    printf("value is %hd and size is %lu \n", b, sizeof(unsigned short));
    printf("value is %hd and size is %lu \n", c, sizeof(signed short));

    long la;
    unsigned long int lb  ;
    signed long lc ;
    printf("enter three long number seperated by spaces \n");
    scanf("%ld %ld %ld", &la, &lb, &lc);
    printf("value is %ld and size is %lu \n", la, sizeof(long));
    printf("value is %ld and size is %lu \n", lb, sizeof(unsigned long));
    printf("value is %ld and size is %lu \n", lc, sizeof(signed long));

    int ia;
    unsigned int ib  ;
    signed int ic ;
    printf("enter three interger number seperated by spaces \n");
    scanf("%d %d %d", &ia, &ib, &ic);
    printf("value is %d and size is %lu \n", ia, sizeof(int));
    printf("value is %d and size is %lu \n", ib, sizeof(unsigned int));
    printf("value is %d and size is %lu \n", ic, sizeof(signed int));

    double d ;
    float f ; 
    printf("enter two decimal number seperated by spaces \n");
    scanf("%f %lf", &f, &d);
    printf("value is %f and size is %lu \n", f, sizeof(float));
    printf("value is %lf and size is %lu \n", d, sizeof(double));
   

}