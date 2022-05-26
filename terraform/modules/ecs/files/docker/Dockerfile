FROM python:3.9-slim-buster

RUN pip install --upgrade pip
RUN pip install flask==2.1.2

WORKDIR /app

COPY files/docker/app/ /app

EXPOSE 80

CMD ["python", "app.py"]
