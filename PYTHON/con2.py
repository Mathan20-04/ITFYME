"""
  simple Hello world program
  By Itfyme.com
"""

def operation():
    print("enter score")
    score=int(input())
    if score<=56:
        print("failing")
    elif score<=65:
        print("unsatisfactory")
    else:
        print("satisfactory")
  
operation()