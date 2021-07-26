public class Book{
    String name;
    Author[] author;
    double price;
    int qty;
    Genre genre;

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Author[] getAuthor() {
        return author;
    }
    public void setAuthor(Author[] author) {
        this.author = author;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public int getQty() {
        return qty;
    }
    public void setQty(int qty) {
        this.qty = qty;
    }
    public Genre getGenre() {
        return genre;
    }
    public void setGenre(Genre genre) {
        this.genre = genre;
    }
    public Book(String name, Author[] author, double price, int qty, Genre genre) {
        this.name = name;
        this.author = author;
        this.price = price;
        this.qty = qty;
        this.genre = genre;
    }
 
    public Book(String name, Author[] author, double price, Genre genre) {
        this.name = name;
        this.author = author;
        this.price = price;
        this.genre = genre;
    }
    public String toString() {
        String str=author[0].toString() +" "+author[1].toString();
        return "Book [author=" + author + ", genre=" + genre + ", name=" + name + ", price=" + price + ", qty=" + qty
                + "]";
    }
   
   
}