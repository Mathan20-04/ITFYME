"""
  simple Hello world program
  By Itfyme.com
"""

def operation():
    print("enter score")
    score=int(input())
    if score<=100 and score>=90:
        print("A")
    elif score<=90 and score>=80:
        print("B")
    elif score<=80 and score>=70:
        print("C")  
    elif score<=70 and score>=50:
        print("D")
    elif score<=50 and score>=30:
        print("E")  
    elif score<=30 and score>=0:
        print("F")
  
  
operation()
