public class Time{
   int hour;
   int minute;
   int second;
   public Time(int hour, int minute, int second) {
      this.hour = hour;
      this.minute = minute;
      this.second = second;
   }
   public int getHour() {
      return hour;
   }
   public void setHour(int hour) {
      this.hour = hour;
   }
   public int getMinute() {
      return minute;
   }
   public void setMinute(int minute) {
      this.minute = minute;
   }
   public int getSecond() {
      return second;
   }
   public void setSecond(int second) {
      this.second = second;
   }
   public void setTime(int hour, int minute, int second) {
      this.hour = hour;
      this.minute = minute;
      this.second = second;
   }
   public String toString() {
      return "Time [hour=" + hour + ", minute=" + minute + ", second=" + second + "]";
   }
   public Time nextSecond(){
      if(this.second+1==60){
         this.second=00;
         if(this.minute==59){
            this.minute=00;
            if(this.hour==23){
               this.hour=00;
            }
         }
      }else {
         this.second=this.second+1;
      }
      return this;
   }
   public Time previousSecond(){
      if(this.second==00){
         this.second=59;
         if(this.minute==00){
            this.minute=59;
            if(this.hour==00){
               this.hour=23;
            }
         }
      }else {
         this.second=this.second-1;
      }
      return this;
   }
   

}