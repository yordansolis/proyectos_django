from django.contrib import admin
from django.urls import path
from crud import views


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", views.home, name="home"),


    path("add_movie/", views.add_movie, name="add_movie"),
    path("update_movie/<int:id>/", views.update_movie, name="update_movie"),
    path("delete/<int:id>/", views.delete, name="delete"),
    path("save_update/", views.save_update, name="save_update"),
    path("register/", views.sign_up, name="register"),
    path("sign_in", views.sign_in, name="sign_in"),
    path('logout/', views.sign_out, name='logout'),
]


from django.conf import settings
from django.conf.urls.static import static

# Configuración para servir archivos multimedia en desarrollo
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
