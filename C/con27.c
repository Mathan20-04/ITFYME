#include<stdio.h>
int main(int argc, char *argv[]) {
    int cusid;
    char name[20];
    float unit,amount;
    printf("Enter cusid\n");
    scanf("%d",&cusid);
    printf("enter name\n");
    scanf("%s",&name);
    printf("customer id:%d\n",cusid);
    printf("name:%s\n",name);
    printf("enter unit\n");
    scanf("%f",&unit);
    if(unit<=199){
        amount=unit*1.20;
    }if(unit>=200 && unit<400){
        amount=unit*1.50;      
    }if(unit>=400 && unit<600){
        amount=unit*1.80;        
    }if(unit>=600){
        amount=unit*2.00;
    }if(unit>400){
        amount=amount+amount*0.15;
    }if(amount<100){
        amount=100;
    }
        printf("total amount=%f",amount);
}
