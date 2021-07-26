public class Date{
    final int[] days={31,28,31,30,31,30,31,31,30,31,30,31};
    int day;
    int  month;
    int  year;
    public Date(int day, int month, int year) {
        this.day = day;
        this.month = month;
        this.year = year;
    }
    public Date() {
    } 
    public int getDay() {
        return day;
    }
    public void setDay(int day) {
        this.day = day;
    }
    public int getMonth() {
        return month;
    }
    public void setMonth(int month) {
        this.month = month;
    }
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }
    @Override
    public String toString() {
        return "Date [" + day + "/" + month + "/" + year + "]";
    }
    public void isLeapYear() {
        if(year%4==0){
            System.out.println(+year+" is leap year");
        }else{
            System.out.println(+year+" is not leap year");
        }
    }
    public Date addDay(int num) {
        int newDay=day+num;
        int newMonth=month;
        System.out.println("new day"+newDay+"new month"+newMonth);
        while(days[newMonth-1]<newDay){
            newDay=newDay-days[newMonth-1];
            System.out.println("deduct"+days[newMonth-1]+"days");
            newMonth++;
            System.out.println("new day"+newDay+"new month"+newMonth);
        }
        return new Date(newDay,newMonth,year);
   
    }
    public Date minDay(int num) {
       int newDay=day-num;
        int  newMonth;
        newMonth=newDay>0?month:month-1;
        while(newDay>0){
            newDay=newDay+days[newMonth-1];
            newMonth--;
        }
        return new Date(newDay,newMonth,year);
    }
    public void diffDate(Date D1,Date D2){
        D1 = new Date(12,03,2000);   
        D2 = new Date(10,03,2000);
        int diff;
        int currmonth;
        if(D1.month>D2.month) {
            diff=days[D2.month]-D2.day;
        }else {
            diff=days[D1.month]-D1.day;
        }
        currmonth=D1.month+1;
        while(D2.month<D1.month){
            diff=diff+days[currmonth];
            System.out.println(diff);
            currmonth++;
        }
        diff=diff+D2.day;
        System.out.println(diff);
    }
        
    //     if(D1.month>D2.month){
    //         diff=days[D2.month-1]-D2.day;
    //     }
    //     else{
    //         diff=days[D1.month-1]-D1.day;
    //     }
    //     while(D2.month<D1.month){
    //         diff=days[month];
    //     }
    //     diff=diff+D2.day;
    //     diff=diff-days[D2.month+1];
    //     System.out.println("days "+diff);
    // }

}