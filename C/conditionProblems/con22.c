#include<stdio.h>
int main(int argc, char *argv[]) {
int temp;
printf("Enter temperature\n");
scanf("%d",&temp);
printf("the temperature=%d\n",temp);
if(temp<0){
    printf("Freezing weather");
}else if(temp>0 && temp<10){
    printf("VeryCold weather");
}else if(temp>10 && temp<20){
    printf("Cold weather");
}else if(temp>20 && temp<30){
    printf("Normal weather");
}else if(temp>30 && temp<40){
    printf("Hot weather");
}else if(temp>=40){
    printf("Veryhot weather");
}
}