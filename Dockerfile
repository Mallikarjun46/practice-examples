# Stage 1: Build
FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Stage 2: Final image
FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 5009

CMD ["python", "app.py"]
