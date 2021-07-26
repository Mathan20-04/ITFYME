/*
simple hellow world program
by  ITfyme.compackage GO
*/

package main

//include library
import "fmt"

func main() {
	var a int //place holder to keep the name
	fmt.Println("enter value of a")
	fmt.Scanln(&a)
	fmt.Println("the value of a is", a)
	a = a * 2
	fmt.Println("final value of a", a)

}
