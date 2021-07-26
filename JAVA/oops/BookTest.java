public class BookTest {
    public static void main(String[] args) {
       // Construct an author instance
        Author ahTeck = new Author("Tan Ah Teck", "ahteck@nowhere.com", 'm');
        System.out.println(ahTeck);  // Author's toString()
        Author[] authors=new Author[2];
        authors[0]=new Author("prem","prem@gmail.com",'m');
        authors[1]=new Author("mathan","mathan@gmail.com",'m');

        // construct Genre
        Genre fiction = new Genre("Fiction", 10);
        Genre nonFiction = new Genre("Non Fiction", 11);
        Book dummyBook = new Book("Java for dummy", authors, 19.95f, 99, fiction);  // Test Book's Constructor
        //System.out.println(dummyBook);  // Test Book's toString()
        
    

        // Test Getters and Setters
        dummyBook.setPrice(29.95);
        dummyBook.setQty(28);
        System.out.println("name is: " + dummyBook.getName());
        System.out.println("price is: " + dummyBook.getPrice());
        System.out.println("qty is: " + dummyBook.getQty());
        System.out.println("Author is: " + dummyBook.getAuthor());  // Author's toString()
        System.out.println("Author's name is: " + dummyBook.getAuthor()[0].getName());
        System.out.println("Author's email is: " + dummyBook.getAuthor()[0].getEmail());

        // Use an anonymous instance of Author to construct a Book instance
        //Book anotherBook = new Book("more Java",new Author("Paul Tan", "paul@somewhere.com", 'm'), 29.95f, nonFiction);
        //System.out.println(anotherBook);  // toString()

    }
 }
 