#include <stdio.h>
int main(int argc, char *argv[]) {
  int score;
  printf("enter score\n");
  scanf("%d",&score);
  if(score<=100 && score>=90){
      printf("A\n");
  }
  else if(score<=90 && score>=80){
      printf("B\n");
  }
    else if(score<=80 && score>=70){
      printf("C\n");
  }
    else if(score<=70 && score>=50){
      printf("D\n");
  }
    else if(score<=50 && score>=30){
      printf("E\n");
  }
    else if(score<=30 && score>=0){
      printf("F\n");
  }
}