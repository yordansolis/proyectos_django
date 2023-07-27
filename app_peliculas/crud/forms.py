# -> estos formularios los usamos para le login
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class LoginForm(forms.Form):
    username = forms.CharField(max_length=65)
    password = forms.CharField(max_length=65, widget=forms.PasswordInput)
    
    username = forms.CharField(widget= forms.TextInput(attrs={
        "class": "form-control", "placeholder":"Nombre de usuario"
    }))
    password = forms.CharField(widget = forms.TextInput(attrs={"class": "form-control", "placeholder":"Contraseña"
    }))

    

class RegisterForm(UserCreationForm):
    class Meta:
        model=User
        fields = ['username','email','password1','password2'] 










class UploadFileForm(forms.Form):    
    name = forms.CharField(label="Enter first name", max_length=100)
    message = forms.CharField(widget=forms.Textarea)
    email = forms.EmailField()
    url = forms.URLField()
    file = forms.FileField()
    field_name = forms.BooleanField() #true o false



    #con propieddees 

    # for creating file input  

