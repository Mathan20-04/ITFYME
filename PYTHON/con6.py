"""
  simple Hello world program
  By Itfyme.com
"""

def operation():
    print("enter year")
    year=int(input())
    if year%4==0:
        print("The year is leap")
    else:
        print("The year is not leap")
 
operation()
