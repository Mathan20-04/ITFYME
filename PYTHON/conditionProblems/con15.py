def operation():
    print("enter attend and total class")
    attend=int(input())
    total=int(input())
    per=(attend/total)*100
    print("percentage of class attend",per)
    if per>=75:
        print("percentage of attend class")
    else:
        print("student can not write exams")

operation()
