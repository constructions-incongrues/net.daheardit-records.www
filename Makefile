PROFILE=www.daheardit-records.net

help: ## Affiche ce message d'aide
	@for MKFILE in $(MAKEFILE_LIST); do \
		grep -E '^[a-zA-Z0-9\._-]+:.*?## .*$$' $$MKFILE | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'; \
	done

attach: ## Connexion au container hébergeant les sources
	docker-compose run --rm --entrypoint fixuid --label traefik.enable=false php /bin/bash

build: ## Génération de l'image Docker
	git submodule update --init --recursive
	docker-compose build

clean: stop ## Suppression des containers de l'application
	docker-compose rm -f

deploy: ## Configure et déploie l'application
	PROFILE=$(PROFILE) docker-compose run --rm --entrypoint fixuid php make configure
	rsync -avzm --dry-run --exclude-from=./env/$(PROFILE)/rsync/exclude --include-from=./env/$(PROFILE)/rsync/include 'ssh -p $$RSYNC_SSH_PORT' $$RSYNC_LOCAL_PATH $$RSYNC_REMOTE_USER@$$RSYNC_REMOTE_HOST:$$RSYNC_REMOTE_PATH

directus-export: ## Export des tables Directus de structure
	docker-compose up -d db
	docker-compose exec db mysqldump -proot daheardit directus_collections directus_fields directus_relations | grep -v 'Warning: Using a password on the command line interface can be insecure.' > ./src/data/fixtures/directus_structure.sql

directus-import: ## Import des tables Directus de structure
	docker-compose up -d db
	docker container exec -i `docker-compose ps -q db` mysql -proot daheardit < ./src/data/fixtures/directus_structure.sql
	docker container exec -i `docker-compose ps -q db` mysql -proot daheardit < ./src/data/fixtures/directus_collection_presets.sql
	docker container exec -i `docker-compose ps -q db` mysql -proot daheardit < ./src/data/fixtures/directus_languages.sql

start: build ## Démarrage de l'application
	docker-compose up

stop: ## Arrêt de l'application
	docker-compose stop
