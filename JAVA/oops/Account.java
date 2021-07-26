package oops;
public class Account {
    int number;
    float balance; 
    int notranscation;
    char[] transtype;
    float[] transamount;
    public static void main(String args[]) {
        Account account = new Account();
        account.initialize(100);
        account.deposit(150);
        account.withdraw(50);
        account.deposit(250);
        account.deposit(500);
        account.printnumtransaction();
        account.printtrans();
    }
    void initialize(int num) {
        transtype=new char[100];
        transamount= new float[100];
        notranscation=0;
        number=num;
    }
    void printnumtransaction() {
        System.out.println("number of transaction = "+notranscation);
    }
    void withdraw(float amount) {
        if(balance>amount) {
            System.out.println("withdrawing amount"+amount);
            transamount[notranscation]=amount;
            transtype[notranscation]='w';
            balance=balance-amount;
            System.out.println("balance"+balance);
            notranscation++;
        }else {
            System.out.println("Balance low ! can not withdraw amount"+amount);
        }
    }
    void deposit(float amount){
        System.out.println("depositing amount"+amount);
        transamount[notranscation]=amount;
        transtype[notranscation]='D';
        balance=balance+amount;
        notranscation++;

    }
    void printtrans() {
        System.out.println("===================================================================================");
        System.out.println("    Account transcation on number :"+number);
        System.out.println("===================================================================================");
        System.out.println("\tsl no \t\t Description \t deposit \t withdrawl \t balance");
        float bal=0.0f;
        for(int i=0;i<notranscation;i++) {
            if(transtype[i]=='w') {
                bal=bal-transamount[i];
                System.out.println("\t"+i+"\t\t withdrawl \t\t\t "+transamount[i]+"\t\t"+bal);
            }else {
                bal=bal+transamount[i];
                System.out.println("\t"+i+"\t\t deposit \t "+transamount[i]+"\t\t\t\t"+bal);
            }
        }
        System.out.println("===================================================================================");

    }

}    