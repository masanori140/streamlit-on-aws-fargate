FROM python:3.9-slim-buster

WORKDIR /app

RUN pip install -U pip poetry

COPY pyproject.toml .
RUN poetry install --no-root --no-dev

COPY . .

EXPOSE 80

CMD poetry run streamlit run /app/app.py
