"""
  simple Hello world program
  By Itfyme.com
"""

def operation():
    print("enter l and b")
    l=int(input())
    b=int(input())
    print("area of rectangle",l*b)
    if l==b:
        print("This is square")
    else:
        print("This is not square")
 
operation()
