"""scanf("%d %d %d",&a,&b,&c);
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
"""

def operation():
    print("enter a,b and c")
    a=int(input())
    b=int(input())
    c=int(input())
    if a<b and a<b:
        print("a is younger and age is",a)   
    elif b<a and b<c:
        print("b is younger and age is=",b)
    else:
        print("c is younger and age is=",c)
    if a>b and a>b:
        print("a is older and age is",a)   
    elif b>a and b>c:
        print("b is older and age is=",b)
    else:
        print("c is older and age is=",c)
 
operation()
