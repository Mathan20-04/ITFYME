"""A company decided to give bonus of 5% to employee if his/her year of service is more than 5 years.
Ask user for their salary and year of service and print the net bonus amount.
"""

def operation():
    print("enter salary and year")
    salary=int(input())
    year=int(input())
    if year>=5:
        bonus=salary*0.05
        totalsalary=salary+bonus
        print("after discount total amount=",totalsalary)
    else:
        print("The amount is=",salary)
 
operation()
