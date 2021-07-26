import java.lang.Thread;

public class Jthread extends Thread {
    public void run() {
        System.out.println("In thread Class!!!!!");
        System.out.println(this.getId());
    }
    
}
