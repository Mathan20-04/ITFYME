public class Main {
    public void log(int[] numbers) {
        //O(n^2) Quadratic
        for(int first:numbers)         //O(n)
            for(int second:numbers )   //O(n)
                Sytem.out.println(firstt+","+second); 
    }
}