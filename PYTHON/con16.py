def operation():
    print("enter a")
    a=int(input())
    if a>0 and a<100:
        print("height is dwarf",a)
    elif a>101 and a<150:
        print("height  is short",a)
    elif a>151 and a<165:
        print("height  is medium",a)
    else:
        print("height  is tall",a)

operation()
