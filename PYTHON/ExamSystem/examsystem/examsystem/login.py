from django.http import HttpResponse

def login(request):
    print(request.GET.get("name"))
    return HttpResponse("This is login")

