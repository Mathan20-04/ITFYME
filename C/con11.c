#include <stdio.h>
int main(int argc, char *argv[]) {
int a,b,c,age;
printf("enter a,b and c\n");
scanf("%d %d %d",&a,&b,&c);
if(a<b && a<c){
    printf("a=%d is youger\n",a);
}
else if(b<a && b<c){
    printf("b=%d is younger\n",b);
}
else {
    printf("c=%d is younger\n",c);
}
if(a>b && a>c){
    printf("a=%d is older",a);
}
else if(b>a && b>c){
    printf("b=%d is older",b);
}
else {
    printf("c=%d is older",c);
}

}