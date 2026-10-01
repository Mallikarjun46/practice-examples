FROM python:3.12-slim
WORKDIR /app
COPY requirement.txt .
RUN pip install requirements.txt
COPY . .
EXPOSE 5009
CMD["app.py" , "python"]
