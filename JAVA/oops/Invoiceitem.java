public class Invoiceitem{
    String Id;
    String desc;
    int qty;
    double unitPrice;
    double Total;
    public Invoiceitem(String id, String desc, int qty, double unitPrice) {
        Id = id;
        this.desc = desc;
        this.qty = qty;
        this.unitPrice = unitPrice;
    }
    public String getId() {
        return Id;
    }
    public String getDesc() {
        return desc;
    }
    public int getQty() {
        return qty;
    }
    public void setQty(int qty) {
        this.qty = qty;
    }
    public double getUnitPrice() {
        return unitPrice;
    }
    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
    public double getTotal(){
        Total=unitPrice*qty;
        return Total;
    }
    public String toString() {
        return "Invoiceitem [Id=" + Id + ", Total=" + Total + ", desc=" + desc + ", qty=" + qty + ", unitPrice="
                + unitPrice + "]";
    }
}