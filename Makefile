# Règles obligatoires

attach:
	docker-compose run --rm --entrypoint fixuid php /bin/bash

build:
	git submodule update --init --recursive
	docker-compose build

start: build
	docker-compose up
