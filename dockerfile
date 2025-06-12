# Etapa 1: Construcción del frontend
FROM node:20 AS frontend
WORKDIR /app/agent-ui
COPY agent-ui/package*.json ./
RUN npm install
COPY agent-ui/ .
RUN npm run build

# Etapa 2: Backend Python
FROM python:3.11-slim AS backend
WORKDIR /app
COPY aienv/ ./aienv/
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el frontend compilado al backend (opcional, si sirves estáticos desde FastAPI)
COPY --from=frontend /app/agent-ui/out ./aienv/static

# Exponer el puerto (ajusta si usas otro)
EXPOSE 8000

# Comando para lanzar el backend (ajusta según tu entrypoint)
CMD ["python", "aienv/Lib/site-packages/agno/app/playground/serve.py"]