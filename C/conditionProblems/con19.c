/*Write a program to find the eligibility of admission for a professional course based on
the following criteria Eligibility Criteria : PCM minimum score should be 55 and
combined score should be minimum 175.*/
#include <stdio.h>
int main(int argc, char *argv[]) {
    int pcmscore,combinedscore;
    printf("enter PCM and Combined scores\n");
    scanf("%d %d",&pcmscore,&combinedscore);
    printf("PCM score=%d\n",pcmscore);
    printf("combined score=%d\n",combinedscore);
    if(pcmscore>=55 && combinedscore>=175){
        printf("eligibility for admission");
    }else{
        printf("not eligiblity for admission");
    }
}