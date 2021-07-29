//We have bunnies standing in a line, numbered 1, 2, ... The odd bunnies (1, 3, ..) have
//the normal 2 ears. The even bunnies (2, 4, ..) we&#39;ll say have 3 ears, because they each
//have a raised foot. Recursively return the number of &quot;ears&quot; in the bunny line 1, 2, ... n
//(without loops or multiplication).
//a. bunnyEars2(0) → 0
//b. bunnyEars2(1) → 2
//c. bunnyEars2(2) → 5
#include <stdio.h>
int bunny(int n) {
    if(n==0){ //base condition
        return 0;
    }
    if(n%2==1) { 
        return 2+bunny(n-1);
    }//decompostion and composition 
    return 3+bunny(n-1);
}
int main() {
    int a,b;
    printf("Enter number a\n");
    scanf("%d",&a); //user input
    int res=bunny(a);
    printf("ears of bunny = %d",res);//calling function
}
