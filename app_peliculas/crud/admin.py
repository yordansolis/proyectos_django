from django.contrib import admin, messages
from .models import Article
from django.contrib import messages
from .models import MisMovie
from .utils import SaveFiles
import os
from .views import delete_movie_and_image

# creamos una clase y la enzamos con el admin por que se refleje alla
class MisMovieAdmin(admin.ModelAdmin):    
    # No muestre el mensaje de éxito predeterminado
    def message_user(self, request, message, level=messages.INFO, extra_tags='', fail_silently=False):
        pass


    def save_model(self, request, obj, form, change):
        if "filename" in form.cleaned_data:
            filename = form.cleaned_data["filename"]

            if SaveFiles(filename) == True:
                # Si la función SaveFiles devuelve True, se procede con el guardado del modelo
                super().save_model(request, obj, form, change)
                # Agregar un mensaje de éxito
                return messages.success(
                    request, f"The movie was added successfully."
                )
            
                
            else:
                # Si la función SaveFiles devuelve False, mostrar un mensaje de error al usuario
                form.add_error("filename", "El archivo ya existe en la ubicación deseada.")
                return messages.error(request, "Error: El archivo ya existe en la ubicación deseada.")

        else:
            # Si no se proporcionó un archivo en el formulario, guardar el modelo sin cambios
             return super().save_model(request, obj, form, change)




    def delete_model(self, request, obj):
        # Llamamos a la función delete_movie_and_image desde views.py
        delete_movie_and_image(obj.pk)
        super().delete_model(request, obj)




        

class Search_Movie(admin.ModelAdmin):
    search_fields = ["moviename"]


class MisMovieAdminWithSearch(MisMovieAdmin, Search_Movie):
    pass



# de esta clase yo puedo traer los datos y mostrarlos al modelo
class ArticleAdmin(admin.ModelAdmin):
    list_display = ["title"]
    search_fields = ["title", "content"]



#registra seactr
admin.site.register(MisMovie, MisMovieAdminWithSearch)

admin.site.register(Article, ArticleAdmin)



