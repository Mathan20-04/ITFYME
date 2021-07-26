public class Accounts1  {
    int balance ;    
    public  int doOperation(char op,  int amount) {
        System.out.println("Operation " + op + " with amount " + amount);
        synchronized(this) {
            System.out.println(" inside the sync ");
            switch (op) {
                case 'D' :
                    balance += amount;
                    break;
                case 'W':
                    balance -= amount;        
                    break ;
                case 'E' :
                    break ;
                default :
                    break ;
            }
        }
        return balance;
    } 
}