ACCOUNT := 123456789012
ENV := myEnv
REGION := us-east-1
SERVICE := myService

.PHONY: tasks

tasks:
	@echo Usage: make [task]
	@echo --------------------
	@echo
	@cat Makefile
	@echo

black:
	docker compose run --rm streamlit black .

build:
	time docker build --platform amd64 -t ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${SERVICE}-${ENV}-streamlit:latest --target production .
	# time docker build -t ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${SERVICE}-${ENV}-streamlit:latest --target production .

build-dev:
	docker compose build

build-prod:
	make build
	make push

clean:
	docker ps -a | xargs docker rm -f; \
	docker images | xargs docker rmi -f; \
	docker builder prune -f

down:
	docker compose down -v

exec:
	docker compose run --rm streamlit /bin/bash

isort:
	docker compose run --rm streamlit isort .

mypy:
	docker compose run --rm streamlit mypy .

pflake8:
	docker compose run --rm streamlit flake8 . --ignore=E501

push:
	aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com
	time docker push ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${SERVICE}-${ENV}-streamlit:latest

up:
	docker compose up -d
