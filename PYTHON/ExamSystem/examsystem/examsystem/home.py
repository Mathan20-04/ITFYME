from django.http import HttpResponse

def home(request):
    print(request.GET.get("name"))
    return HttpResponse("This is Home")

def state(request):
    return HttpResponse("This is Home/State")
