def operation():
    print("enter year")
    year=int(input())
    y=year%100
    if y==0:
        print("The year is century")
    else:
        print("The year is not century")
    if year%4==0:
        print("The year is leap")
    else:
        print("The year is not leap")

operation()
