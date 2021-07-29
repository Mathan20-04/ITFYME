import java.util.Scanner;
public class Factorial{
    public static int fact(int n){
        if(n==1){
            return 1;
        }
        return n*fact(n-1);
    }
    public static void main(String[] args) {
        System.out.println("Enter number");
        Scanner scanner = new Scanner(System.in);
        int num = scanner.nextInt();
        int factorial = fact(num);
        System.out.println("factorial of "+num+" is "+factorial);
    }
}