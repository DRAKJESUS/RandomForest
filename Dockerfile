# Usa una imagen base de Python
FROM python:3.11-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo requirements.txt y lo instala
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia todos los archivos de la aplicación en el contenedor
COPY . .

# Expone el puerto 10000 (o el puerto que prefieras) para el servidor Flask
EXPOSE 10000

# Define las variables de entorno necesarias
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=10000

# Comando para ejecutar la aplicación Flask
CMD ["flask", "run"]
