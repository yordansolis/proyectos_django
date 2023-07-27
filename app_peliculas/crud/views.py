from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.http import HttpResponse, JsonResponse
from .forms import UploadFileForm
from .models import MisMovie
from .utils import Save_View
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, authenticate, logout
from .forms import RegisterForm, LoginForm
import os


def home(request):
    movies = MisMovie.objects.values()

    if request.user.is_authenticated:
        usuario_actual = request.user.username
        id = request.user.id

        # Filtrar las películas que pertenecen al usuario actual
        user_movies = []
        for movie in movies:
            if movie["user_id"] == id:
                user_movies.append(movie)

        return render(
            request,
            "home.html",
            {"movies": user_movies, "usuario_actual": usuario_actual},
        )

    else:
        return render(request, "home.html", {"movies": movies})


def sign_up(request):
    if request.method == "GET":
        form = RegisterForm()
        return render(request, "login/register.html", {"form": form})

    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            # Guarda el user en la base de datos solo si commit=True
            user = form.save(commit=False)
            user.username = user.username.lower()
            user.save()

            messages.success(request, "you have singed up successfully")
            login(request, user)

            return redirect("home")

        else:
            messages.error(request, "Corrija los errores")
            return render(request, "login/register.html", {"form": form})


def sign_in(request):
    if request.method == "GET":
        form = LoginForm()

        return render(request, "login/login.html", {"form": form})

    elif request.method == "POST":
        form = LoginForm(request.POST)

        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password"]
            user = authenticate(request, username=username, password=password)
            print(user)
            if user:
                login(request, user)
                return redirect("home")

            pass
        else:
            return HttpResponse("DASTOS INCORRECOTS")


def sign_out(request):
    logout(request)
    messages.success(request, f"Has sido desconectado.")
    return redirect("sign_in")


@login_required
def add_movie(request):
    if request.method == "POST":
        form = UploadFileForm(request.POST, request.FILES)
        print(request.POST)
        if form:
            moviename = request.POST["moviename"]
            datetime = request.POST["datetime"]
            filename = request.FILES["filename"].name
            autor = request.POST['autor'].title()
            comentario = request.POST['comentario']


            # Asignamos el usuario actual al campo 'user'
            user = request.user

            resul = Save_View(request.FILES["filename"])

            if resul == True:
                savedata = MisMovie.objects.create(
                    moviename=moviename, datetime=datetime, filename=filename, autor = autor, comentario= comentario,  user=user
                )

                return redirect("home")
            else:
                return HttpResponse(
                    "<h1>Esa imagen ya existe en la lista intente con otra <h1>"
                )

    else:
        return render(
            request, "add.html", {"error": "error los datos no han sido cargados"}
        )

    return render(request, "add_movie.html")


@login_required
def delete(request, id):
    query_user = MisMovie.objects.filter(user=request.user)
    post = get_object_or_404(query_user, pk=id)

    # id_peli = MisMovie.objects.get(pk=id)
    file = MisMovie.objects.get(pk=id).filename
    nombre_imagen = file.name

    ruta_archivo = os.path.join("media/img/" + nombre_imagen)
    os.remove(ruta_archivo)
    # id_peli.delete()
    post.delete()
    return redirect("home")


# elimina la foto con el administrador
def delete_movie_and_image(movie_id):
    try:
        movie = MisMovie.objects.get(pk=movie_id)
        file = movie.filename
        nombre_imagen = file.name

        ruta_archivo = os.path.join("media/img/", nombre_imagen)
        if os.path.exists(ruta_archivo):
            os.remove(ruta_archivo)

        movie.delete()

        return True
    except MisMovie.DoesNotExist:
        return False


@login_required
def update_movie(request, id):
    query_user = MisMovie.objects.filter(user=request.user)
    post = get_object_or_404(query_user, pk=id)
    # print(query_user)
    # print(post)
    id_peli = MisMovie.objects.get(pk=id)

    file = MisMovie.objects.get(pk=id).filename

    imgUrl = "media/img/" + file.name

    datos_update = {
        "id": id_peli.id,
        "name": id_peli.moviename,
        "fecha": id_peli.datetime,
        "file": file.name,
        "imgurl": imgUrl,
    }
    # print(datos_update)
    # return JsonResponse(datos, safe=False)
    return render(request, "update.html", {"datos_update": datos_update})


@login_required
def save_update(request):
    query_user = MisMovie.objects.filter(user=request.user)

    id_movie = request.POST["id"]
    data_MisMovie = get_object_or_404(MisMovie, id=id_movie)

    if request.method == "POST" and request.FILES:
        data_MisMovie.moviename = request.POST["moviename"]
        data_MisMovie.datetime = request.POST["datetime"]

        if data_MisMovie.filename:
            ruta_archivo = os.path.join(
                settings.MEDIA_ROOT, str(data_MisMovie.filename)
            )

            os.remove(ruta_archivo)
            Save_View(request.FILES["filename"])

            data_MisMovie.filename = request.FILES["filename"].name

            data_MisMovie.save()
            return redirect("home")
    else:
        data_MisMovie.moviename = request.POST["moviename"]
        data_MisMovie.datetime = request.POST["datetime"]
        data_MisMovie.save()

        return redirect("home")
