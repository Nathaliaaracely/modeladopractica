FROM python:3.11-slim

WORKDIR /app

# Copiar archivos necesarios
COPY requirements.txt .
COPY playground.py .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["python", "playground.py"]
