#include<stdio.h>
int main(int argc, char *argv[]) {
    float a,b;
    char operator;
    printf("enter the operator\n");
    scanf("%c",&operator);
    printf("enter a and b\n");
    scanf("%f %f",&a,&b);
    switch(operator)
    {
        case '+':
        printf("%f+%f=%f",a,b,a+b);
        break;
        case '-':
        printf("%f-%f=%f",a,b,a-b);
        break;
        case '*':
        printf("%f*%f=%f",a,b,a*b);
        break;
        case '/':
        printf("%f/%f=%f",a,b,a/b);
        break;
        default:
        printf("ivalid num");
        break;

    }
   
}
