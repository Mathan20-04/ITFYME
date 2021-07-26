
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
public class Color{
    public static void main(String[] args) {
        //1. Write a Java program to create a new array list, add some colors (string) and print out the collection. 
        System.out.println("By Arraylist");
        ArrayList<String> Color=new ArrayList<String>(); //create array list
        Color.add("red");
        Color.add("blue");
        Color.add("grey");
        Color.add("black");
        Color.add("light blue");
        System.out.println(Color.size());
        System.out.println(Color.add("yellow"));
        System.out.println("printing the collection colors");
        for(int i=0;i<Color.size();i++) {
            System.out.println(Color.get(i)); //print all colors in the array list
        }
        System.out.println("****************************************************************");
        //2.Write a Java program to iterate through all elements in a array list. 
        System.out.println("By Iterator");
        Iterator<String> it = Color.iterator();
        while(it.hasNext()) {
            System.out.println(it.next());
        }
        System.out.println("By forEach");
        Color.forEach((ele) -> {
            System.out.println(ele);
        });    
        System.out.println("****************************************************************");
        //3.Add color in the first position of the arry list
        System.out.println("Add color in the first position of Array list");
        Color.add(0,"white");
        System.out.println("Color"+Color);
        System.out.println("****************************************************************");
        //4.retrieve an element (at a specified index) from a given array list. 
        System.out.println("retrieve an element (at a specified index) from a given array list");
        System.out.println(Color.get(3));
        System.out.println("remove element in array list");
        Color.remove("grey");
        System.out.println("Color"+Color);
        System.out.println("****************************************************************");
        //5.Write a Java program to update specific array element by given element. 
        System.out.println("update specific array element by given element");
        System.out.println("Color"+Color);
        Color.set(3, "vilot");
        System.out.println("Color"+Color);
        System.out.println("****************************************************************");
        //7.Write a Java program to search an element in a array list. 
        System.out.println("search an element in a array list");
        if(Color.contains("red")==true) {
            System.out.println("The Element is present");
        }else{
            System.out.println("The Element is not present");
        }
        System.out.println("****************************************************************");
        // 9.Write a Java program to sort a given array list. 
        System.out.println("sort a given array list");
        Collections.sort(Color);
        System.out.println("Color"+Color);
        System.out.println("****************************************************************");
        //10.Write a Java program to shuffle elements in a array list
        System.out.println("shuffle a given array list");
        Collections.shuffle(Color);
        System.out.println("Color"+Color);
        System.out.println("****************************************************************");        
        //11.Write a Java program to reverse elements in a array list.
        System.out.println("reverse elements in a array list");
        Collections.reverse(Color);
        System.out.println("Color"+Color);
        System.out.println("****************************************************************");
        //12.Write a Java program to extract a portion of a array list. 
        //ArrayList<String>sub_List = Color.subList(0,3);
        //System.out.println("List of first three elements: " + sub_List);
        //13.Write a Java program to compare two array lists. 
        System.out.println("compare two array lists");
        ArrayList<String> Color1=new ArrayList<>(); //create array list
        Color1.add("dark blue");
        Color1.add("blue");
        Color1.add("grey");
        Color1.add("black");
        Color1.add("purple");
        Color1.add("dark green");
        System.out.println(Color.equals(Color1));  
        System.out.println("****************************************************************"); 
        //Write a Java program to copy one array list into another. 
        System.out.println("********************************");
        System.out.println("Array List Color"+Color.size());
        System.out.println("Array List Color"+Color1.size()); 
        System.out.println("********************************");
        Collections.copy(Color1, Color);
        System.out.println("Color"+Color);
        System.out.println("Color1"+Color1);    
        System.out.println("****************************************************************");    
        //Write a Java program of swap two elements in an array list. 
        System.out.println("swap two elements in an array list");
        System.out.println(Color);
        Collections.swap(Color, 2, 4);
        System.out.println(Color);        
        System.out.println("****************************************************************");
        //Write a Java program to join two array lists. 
        System.out.println("join two array lists Color and Color1");
        Color.addAll(Color1);
        System.out.println("Color"+Color);
        System.out.println("clear color");
        Color1.clear();
        System.out.println(Color1);
        Color1.add("light yellow");
        Color1.add("dark green");
        System.out.println(Color1);
        System.out.println("****************************************************************");
        //Write a Java program to test an array list is empty or not. 
        System.out.println("test an array list is empty or not");
        if(Color1.isEmpty()==true) {
            System.out.println("Array list is empty");
        }else{
            System.out.println("Array list is not empty");
        }
        System.out.println("****************************************************************");
        // Collections.replaceAll(list, oldVal, newVal)
        // Write a Java program to trim the capacity of an array list the current list size. 
        System.out.println(" Write a Java program to trim the capacity of an array list the current list size");
        System.out.println("original arraylist"+Color);       
        Color.trimToSize();
        System.out.println(Color);
        System.out.println("****************************************************************");
        //Write a Java program to increase the size of an array list.       
        System.out.println("before array size"+Color.size());
        Color.ensureCapacity(13);
        System.out.println("after array size"+Color.size());
        System.out.println("****************************************************************");
        //find a indexof element of arraylist
        System.out.println("indexof element red of arraylist");
        System.out.println(Color.indexOf("red"));
        System.out.println("****************************************************************");
        //Write a Java program to replace the second element of a ArrayList with the specified element. 
        for(int i=0;i<Color.size();i++) {
            System.out.println(Color.get(i));
        }
        System.out.println("****************************************************************");   
        // Write a Java program to print all the elements of a ArrayList using the position of the elements.
        System.out.println("\nOriginal array list: " + Color);
        System.out.println("\nPrint using index of an element: ");
        int noofelements = Color.size();
        for (int i = 0; i < noofelements; i++){
            System.out.println(Color.get(i));
        }
        System.out.println("****************************************************************");
        //Write a Java program to replace the second element of a ArrayList with the specified element.
        System.out.println(Color);
        Color.set(2,"orange");
        System.out.println(Color);
        System.out.println("****************************************************************");
    } 

}