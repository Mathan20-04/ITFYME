#include <stdio.h>
#include <string.h>

// this system holds maximum 1000 number of books
#define MAX_BOOK_NUM 1000

// this is definition just like int, float etc..
// not an instance of variable
struct book {
    char    title[128];
    char    author[128];
    float   price;
    int     ID ;    // uniquely identfies the book
    int     stock ; // current number of books available
    int     year ;  // year of publication
    int     numOfBooks ;    // number of copies in the library 
} ;

struct book bks[MAX_BOOK_NUM] ; // declare array of books to hold the book value

int numBooks = 0 ;      // total number of titles available in the library
int totalCopies=0;    // total number of copies available
int totalStock=0;     // total stock currently available in library

void addToLibrary(struct book newBook) {
    strcpy(bks[numBooks].title, newBook.title);
    strcpy(bks[numBooks].author, newBook.author);
    bks[numBooks].price = newBook.price ;
    bks[numBooks].ID = newBook.ID ;
    bks[numBooks].year = newBook.year ;
    bks[numBooks].numOfBooks = newBook.numOfBooks ;
    bks[numBooks].stock = newBook.numOfBooks ;
    numBooks++;
    totalCopies += newBook.numOfBooks ;
    totalStock += newBook.numOfBooks ;
    
    printf("Books %s with %d number of copies is added to library\n", newBook.title, newBook.numOfBooks);
    printf("Current number of books in the library is %d \n", numBooks);
    // bks[numBooks] = newBook ;
}

void add() {
    struct book temp ;
    getchar();
    printf("Please enter the title of the book\n");
    fgets(temp.title,128,stdin);
    printf("Please enter the author of the book\n");
    fgets(temp.author,128,stdin);
    printf("Please enter the Price, ID, year, number of copies with spaces in between\n");
    scanf("%f %d %d %d",&temp.price, &temp.ID,&temp.year,&temp.numOfBooks );
    addToLibrary(temp);

}
int getBookIndexById (int id) {
    for(int i=0;i<numBooks;i++){
        if(id==bks[i].ID){
            return i;
        }      
    }
    return -1;     
}    


void view(int num) {
    getBookIndexById(1);
    printf("Sl No\tTitle\t\tAuthor\t\tYear\tPrice\t\tID\tNum\tStock\n");
    printf("======================================================================================\n");
    printf("%d\t%s\t\t\t%s\t\t\t\t\t%d\t%f\t%d\t%d\t%d\n", 
    num,bks[num].title, bks[num].author, 
    bks[num].year, bks[num].price,bks[num].ID, 
    bks[num].numOfBooks, bks[num].stock);
    printf("======================================================================================\n");


}
void view1() {
    int id;
    printf("Enter id\n");
    scanf("%d",&id); //get index
    int index=getBookIndexById(id);
    if(index == -1){
        printf("unable to find the books with Id %d\n",id);
    }else{
        view(index);
    }
}
void issue(){
    int id;
    printf("Enter id\n");
    scanf("%d",&id); //get index
    int index=getBookIndexById(id);
    if(index == -1){
    printf("unable to find the books with Id %d\n",id);
    }else{
        if(bks[index].stock>0){
            bks[index].stock--;
            totalStock--;
            printf("issue book\n");
        }
        else{
            printf("not available");
        }
    }



}
void rece(){
    int id;
    printf("Enter id\n");
    scanf("%d",&id); //get index
    int index=getBookIndexById(id);
    if(index == -1){
    printf("unable to find the books with Id %d\n",id);
    }else{
        
        bks[index].stock++;
        totalStock++;
        printf("retrun book\n");
    }
}
void delete() {
    int id;
    printf("Enter id\n");
    scanf("%d",&id); //get index
    int index=getBookIndexById(id);
    if(index == -1){
    printf("unable to find the books with Id %d\n",id);
    }else if(id==bks[index].ID){
        for(int i=index;i<numBooks;i++){
            bks[i]=bks[i+1];     
                           
        }
        numBooks--;
        printf("delete");
    }else{
        printf("unable to delete\n");
    }
        

}
void report(){
    if(bks[numBooks].stock>10){
        view(numBooks);
    }else{
        printf("unavailable");
    }

}
void list() {
    int idx = numBooks-1 ;
    printf("List of books are: \n");  
    while (idx >=0){
        view(idx);
        idx--;
    }

}

void writeToFile() {
    FILE *fp = fopen("libsys.data","w") ;
    if (fp != NULL) {
        fwrite(&bks, sizeof(struct book), numBooks, fp) ; 
        printf("Saved to file!!!\n");
    }
    fclose(fp);
    return ;
}

void readFromFile() {
    FILE *fp = fopen("libsys.data","r") ;
    struct book bk[3];
    if (fp != NULL) {
        numBooks =  fread(&bks, sizeof(struct book), MAX_BOOK_NUM, fp) ; 
    }
    fclose(fp);
}
void command() {
    printf("Following are available commands:\n");
    printf("A       - to Add\n");
    printf("M       - to Modify, where num is books number\n");
    printf("D       - to Delete, where num is books number\n");
    printf("V       - to View, where num is books number \n");
    printf("S       - to Save library data to file \n");
    printf("L       - to list all the books details\n");
    printf("Q       - to Quit the system \n");
    printf("H       - to view help! \n");
}

void welcome() {
    printf("======================================================\n");
    printf("        Welcome to Library management system! \n");
    printf("         developed by ITFyMe students!!\n");
    printf("Type 'H' to see the commands to operate book system\n\n");
    printf("======================================================\n");
}

int main() {
    
    // help user to understand what this system is all about
    welcome() ;
    readFromFile();
    

    // wait for the user input
    // accept the user input
    printf("LibSys:>>>");
    char cmd ;
    cmd = getchar();
    
    while (cmd != 'Q') {
        switch (cmd) {
            case 'A':
                printf("add book to library\n");
                add();
                break ;
            case 'M': 
            //    modify();
               break ;
            case 'D':
                delete();
                printf("Delete book\n");
                break ;
            case 'V':
                view1();
                break ;
            case 'H':
                command();
                break ;
            case 'S':
                writeToFile();
                printf("Save book\n");
                break ;
            case 'Q':
                printf("Quit application\n");
                break ;
            case 'L':
                list();
                break ;
            case 'I':
                issue();
                break;
            case 'R':
                rece();
                break ;
            case 'P':
                report();
                break;
            case ' ':
                break ;
                     
            default :
                printf("Unknown command!!!\n");
                break ;
        }
        printf("LibSys:>>>");
        cmd = getchar();
    }
    return 0;
}