public class TJthread {
    public static void main(String[] args) {
        Jthread t1 = new Jthread();
        t1.start();
        Jthread t2 = new Jthread();
        t2.start();
    }
}