FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir

# Принудительно копируем settings.py перед общей копией
COPY kittygram_backend/settings.py /app/kittygram_backend/settings.py

COPY . .

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "kittygram_backend.wsgi"]

