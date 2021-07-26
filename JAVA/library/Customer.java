import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.time.format.DateTimeFormatter;
import javax.swing.text.DateFormatter;
import java.util.*;
public class Customer extends Person implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private static final String custfile = "./customer.data" ;
    int AccountID;
    Date joinDate;
    Date TransDate;
    int numOfBooks;
    public Customer(int iD, String name, String emailID, int phoneNum, int accountID, Date joinDate, Date transDate,
            int numOfBooks) {
        super(iD, name, emailID, phoneNum);
        AccountID = accountID;
        this.joinDate = joinDate;
        TransDate = transDate;
        this.numOfBooks = numOfBooks;
    }
    public int getAccountID() {
        return AccountID;
    }
    public void setAccountID(int accountID) {
        AccountID = accountID;
    }
    public Date getJoinDate() {
        return joinDate;
    }
    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }
    public Date getTransDate() {
        return TransDate;
    }
    public void setTransDate(Date transDate) {
        TransDate = transDate;
    }
    public int getNumOfBooks() {
        return numOfBooks;
    }
    public void setNumOfBooks(int numOfBooks) {
        this.numOfBooks = numOfBooks;
    }
    @Override
    public String toString() {
        return "Customer [AccountID=" + AccountID + ", TransDate=" + TransDate + ", joinDate=" + joinDate
                + ", numOfBooks=" + numOfBooks + "]";
    }
    public static void save(ArrayList<Customer> customerlist) {
        System.out.print("Saving master Customer list in the file!!!");
        try {
            FileOutputStream fileOut =new FileOutputStream(custfile);
            ObjectOutputStream out = new ObjectOutputStream(fileOut);
            out.writeObject(customerlist);
            out.close();
            fileOut.close();
            System.out.println("Customer data is saved!");
        } catch (IOException i) {
            i.printStackTrace();
        }
    }

    public static ArrayList<Customer> initializeFromFile() {
        try {
            File f = new File(custfile) ;
            if (!f.exists()) {
                return new ArrayList<Customer>();
            }
            FileInputStream fileIn = new FileInputStream(custfile);
            ObjectInputStream in = new ObjectInputStream(fileIn);
            ArrayList<Customer> list  = (ArrayList<Customer>) in.readObject();
            in.close();
            fileIn.close();
            return list ;
        } catch (IOException i) {
            i.printStackTrace();
            return null;
        } catch (ClassNotFoundException c) {
            System.out.println("customer class not found");
            c.printStackTrace();
            return null;
        }
    }
    public static Customer add() throws Exception {
        int AccountID;
        Date joinDate;
        Date TransDate;
        int numOfBooks;
        System.out.println("enter id");
        int id=Integer.parseInt(System.console().readLine());
        System.out.println("Enter name");
        String Name=System.console().readLine();
        System.out.println("Enter emailid");
        String emailid=System.console().readLine();
        System.out.println("enter phone num");
        int phonenum=Integer.parseInt(System.console().readLine());
        System.out.println("Please enter Accountid");
        AccountID = Integer.parseInt(System.console().readLine());
        System.out.println("Please enter join date");
        SimpleDateFormat df = new SimpleDateFormat("dd/mmm/yyyy");
        String jdate=System.console().readLine();
        Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(jdate); 
        System.out.println("Please enter join date");
        String tdate=System.console().readLine();
        Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(tdate);
        System.out.println("enter numofbooks");
        int numofbooks=Integer.parseInt(System.console().readLine());
        return new Customer(id,Name,emailid,phonenum,AccountID,date1,date2,numofbooks);
    }     
    public static Customer update(Customer customer) throws Exception {
        System.out.println("customer details are");
        System.out.println(customer);
        System.out.println("Please update numofbooks");
        int numofbooks = Integer.parseInt(System.console().readLine());
        System.out.println("read name is " + numofbooks);
        customer.numOfBooks=numofbooks;
        System.out.println("update name");
        System.out.println("Please update customer name");
        String name = System.console().readLine();
        System.out.println("read name is " + name);
        customer.setName(name);
        String email = System.console().readLine();
        System.out.println("read name is " + email);
        customer.setName(email);
        int phonenum = Integer.parseInt(System.console().readLine());
        System.out.println("read name is " + phonenum);
        customer.setPhoneNum(phonenum);
        System.out.println("Please update join date");
        String jdate=System.console().readLine();
        Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(jdate);
        customer.setJoinDate(date1);
        String tdate=System.console().readLine();
        Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(tdate);
        customer.setTransDate(date2);
        return customer;
    }        
    public static int findByID(ArrayList<Customer> list, int id) {
        int idx = -1;
        int size = list.size() ;
        for (int i = 0; i < size; i++) {
            if (list.get(i).getID() == id) {
                idx = i ;
            }
        }
        return idx ;
    }
        
}