ACCOUNT := 123456789012
ENV := prod
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
	time docker build -t ${ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com/${SERVICE}-${ENV}-streamlit:latest --target production .

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
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com
	time docker push ${ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com/${SERVICE}-${ENV}-streamlit:latest

up:
	docker compose up -d
