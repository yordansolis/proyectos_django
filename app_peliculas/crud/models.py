from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class MisMovie(models.Model):
    moviename = models.CharField(max_length=100)
    autor = models.CharField(max_length=100)
    comentario = models.CharField(max_length=100)
    datetime = models.DateField()
    filename = models.ImageField(upload_to='img/' ,max_length=100, null=True, blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
  
    def __str__(self):
        name  =self.moviename
        username = self.user.username
        
        formatted_date = self.datetime.strftime('%Y-%m-%d')
        return f"{username} - {name}  - {formatted_date}"
    


class FlatPageAdmin(models.Model):
    fieldsets = [
        (
            None,
            {
                "fields": ["url", "title", "content", "sites"],
            },
        ),
        (
            "Advanced options",
            {
                "classes": ["collapse"],
                "fields": ["registration_required", "template_name"],
            },
        ),
    ] 


class Article(models.Model):
    title = models.TextField()
    content= models.TextField()       