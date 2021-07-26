/* 
A company decided to give bonus of 5% to employee if his/her year of service is more than 5 years.
Ask user for their salary and year of service and print the net bonus amount.

*/
#include <stdio.h>
int main(int argc, char *argv[]) {
int salary,year,totalsalary,bonus;
printf("enter salary and year\n");
scanf("%d %d",&salary,&year);
if(year>=5){
    bonus=salary*0.05;
    totalsalary=salary+bonus;
    printf("after discount total amount=%d",totalsalary);
}else{
    printf("the amount is=%d",salary);
}

}