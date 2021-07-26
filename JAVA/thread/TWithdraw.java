import java.lang.Thread;
public class TWithdraw implements Runnable {
    Accounts accounts ;
    public TWithdraw(Accounts acc) {
        accounts = acc ;
    }
    public void run() {
        System.out.println("In Withdraw Class!");
        int bal = accounts.doOperation('W',100) ;
        System.out.println("After withdrawing " + 100 + " the balance is " + bal);
    }
}