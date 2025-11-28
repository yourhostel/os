FROM python:3.12-slim

# В середені контейнеру створюємо папку /app
WORKDIR /app

# Залежності
COPY packages.txt /app/packages.txt
RUN pip install --no-cache-dir -r packages.txt

# Код апки
COPY main.py /app/main.py

EXPOSE 5000

CMD ["python", "main.py"]