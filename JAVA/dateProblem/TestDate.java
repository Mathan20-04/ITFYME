public class TestDate{
    
    public static void main(String args[]){
        Date D1;
        Date D2;
        Date D3;
        D1 = new Date(12,03,2000);
        D2 = new Date(17,03,2000);
        D3 = new Date();
        System.out.println(D1.toString());   
        System.out.println(D2.toString());
        D1.isLeapYear();
        System.out.println(D1.addDay(29));
        // System.out.println(D1.minDay(1).toString());
        D3.diffDate(D1,D2);
    }
}