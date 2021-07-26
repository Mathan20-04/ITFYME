public class Integer {
    int a;
    int b;
    public Integer() {
    }
    public Integer(int a, int b) {
        this.a = a;
        this.b = b;
    }
    public int getA() {
        return a;
    }
    public void setA(int a) {
        this.a = a;
    }
    public int getB() {
        return b;
    }
    public void setB(int b) {
        this.b = b;
    }
    @Override
    public String toString() {
        return "Integer [a=" + a + ", b=" + b + "]";
    }
    public void add(){
        int c=a+b;
        System.out.println("addition of "+a+" and "+b+" = "+c);

    } 
    public void sub(){
        int c=a-b;
        System.out.println("subtraction of "+a+" and "+b+" = "+c);

    }  
    public void mul(){
        int c=a*b;
        System.out.println("multiplication of "+a+" and "+b+" = "+c);

    }
    public void div(){
        int c=a/b;
        System.out.println("division of "+a+" and "+b+" = "+c);

    }  
    public void mod(){
        int c=a%b;
        System.out.println("modulus of "+a+" and "+b+" = "+c);
    }   
    public void pow(){
        int c=1;
        System.out.println("power "+a+" of "+b);
        while(b!=0){
            c=c*a;
            b--;
        }
        System.out.println(+c);
    }  
    public void isposneg(){
        if(a>0){
            System.out.println("the number "+a+" is positive");
        }else{
            System.out.println("the number "+a+" is negative");
        }
    }
    public void isevenodd(){
        if(a%2==0){
            System.out.println("the number "+a+" is even");
        }else{
            System.out.println("the number "+a+" is odd");

        }
    } 
    public void isprime(){
        int prime=0;
        for(int i=2;i<a/2;i++){
            if(a%i==0){
                prime=1;
                break;
            }
        }    
        if(prime==0){
            System.out.println("the number "+a+" is prime");
        }else{
            System.out.println("the number "+a+" is not prime");
        }          
    }
    public void isamstrong(){
    }
    void fact(int a){
        int fact=1;
        for(int i=1;i<=a;i++){
            fact=fact*i;
        }
        System.out.println("factorial of "+a+"="+fact);
    }
    public void sumofdigits(){
        int digit,sum=0;
        while(a>0){
            digit=a%10;
            sum=sum+digit;
            a=a/10;
        }
        System.out.println("sum of digits ="+sum);
    }

    
}      
    
    