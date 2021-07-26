public class TstInterface  {
    static class crcl implements Drawable {
        public void draw() {
            System.out.println("implementation of draw crcl!");
        }
    }
    static class square implements Drawable {
        public void draw() {
            System.out.println("implementation of draw square!");
        }
    }
    static class rect implements Drawable {
        public void draw() {
            System.out.println("implementation of draw rect!");
        }
    }
    public static void main(String args[]){
        square tst2 =new square();
        crcl tst = new crcl();
        rect tst1 = new rect();
        tst.draw();
        tst1.draw();
    }
}