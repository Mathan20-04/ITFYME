#include<stdio.h>
#include<string.h>
int gcd(int a,int b){
    if(a%b==0){
        return b;
        }
        gcd(b,a%b);
    }  

int main(){
    int x,y;
    printf("Enter the x and y\n");
    scanf("%d %d",&x,&y);
    printf("gcd=%d",gcd(x,y)) ;
}
 