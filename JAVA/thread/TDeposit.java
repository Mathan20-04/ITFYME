import java.lang.Thread;
public class TDeposit implements Runnable {
    Accounts accounts ;
    public TDeposit(Accounts acc) {
        accounts = acc ;
    }
    public void run() {
        System.out.println("In Deposit Class!");
        int bal = accounts.doOperation('D',200) ;
        System.out.println("After deposting " + 200 + " the balance is " + bal);
    }
}