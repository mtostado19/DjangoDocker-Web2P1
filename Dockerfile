# Que va a instalar:
FROM python:3.10

# De quien es el label: 
LABEL MIGUEL TOSTADO

#Definir variables de entorno
ENV PYTHONUNBUFFERED 1

#copia el contenido de esta computadora al destino seleccionado dentro del contenedor.
COPY ./requirements.txt /requirements.txt

#instala las librerías de python indicadas en el arhicvo
RUN pip install -r /requirements.txt

# crea carpeta /app -> donde estará la aplicación
RUN mkdir /app

# establesco que la carpta de trabajo va a ser /app
WORKDIR /app

#Copias toda la carpeta ./app en este folder a la carpeta /app del contenedor
COPY ./app /app

# #
# COPY ./.env /app/apirest/.env

# #
# COPY ./debug /app/debug.log

# #
# RUN chmod +777 /app/debug.log

# Genera un nuevo usuario en user que es el que va a correr el programa para crear una capa extra de seguridad.
# Para que no sea root el que lo corra
RUN useradd -ms /bin/bash newuser

# entrar como el nuevo usuario
USER newuser