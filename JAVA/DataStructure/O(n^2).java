public class Main {
    public void log(int[] numbers) {
        //O(n) linearly
        //O(1+n+1)=O(2+n)
        System.out.println(numbers[0]); //O(1)
        for(int number:numbers)         //O(n)
            Sytem.out.println(number);  //O(1)
    }
}