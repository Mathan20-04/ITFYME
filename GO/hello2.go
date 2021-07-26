/*
simple hellow world program
by  ITfyme.compackage GO
*/

package main

//include library
import "fmt"

func main() {
	var name string //place holder to keep the name
	fmt.Println("please enter your name")
	fmt.Scanln(&name) //system call which accepts the name and stores
	fmt.Println("Hello! " + name + " !Welcome to programming world")
}
