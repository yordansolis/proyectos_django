# utils.py
# funciones para guardar imagen 
import os

def SaveFiles(filename):
    file_path = "media/img/" + filename.name
    if os.path.exists(file_path):
        return False


    return True




def Save_View(filename):
    file_path = "media/img/" + filename.name
    if os.path.exists(file_path):
        return False
    
    with open(file_path, "wb+") as destination:
      for chunk in filename.chunks():
         destination.write(chunk)

    return True     
