/* 
    multiply by 3.5
*/

// include library
#include <stdio.h>
int main(int argc, char *argv[]) {
  int score;
  printf("enter score\n");
  scanf("%d",&score);
  if(score<=56){
      printf("failing\n");
  }
  else if(score<=65){
      printf("unsatisfactory\n");
  }
  else{
      printf("satisfactory\n");
}
}
