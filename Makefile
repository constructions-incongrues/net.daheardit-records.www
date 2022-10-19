PROFILE := www.daheardit-records.net
RSYNC_PARAMETERS=--dry-run

include ./etc/$(PROFILE)/.env
export $(shell sed 's/=.*//' ./etc/$(PROFILE)/.env)

help: ## Affiche ce message d'aide
	@for MKFILE in $(MAKEFILE_LIST); do \
		grep -E '^[a-zA-Z0-9\._-]+:.*?## .*$$' $$MKFILE | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'; \
	done

attach: ## Connexion au container hébergeant les sources
	docker-compose run --rm --entrypoint fixuid --label traefik.enable=false php /bin/bash

build: ## Génération de l'image Docker
	git submodule update --init --recursive
	docker-compose build --build-arg FIXUID_UID=$$(id -u) --build-arg FIXUID_GID=$$(id -g)

clean: stop ## Suppression des containers de l'application
	docker-compose rm -f

cache-clean-symfony:
	ssh daheardit-record@ftp.pastis-hosting.net ./httpdocs/src/symfony cc

database-import: ## Récupération de la base de donnée de production
	ssh daheardit-record@ftp.pastis-hosting.net mysqldump -h127.0.0.1 -udaheardit-record -pdaheardit-reco daheardit-record > ./src/data/fixtures/daheardit.sql

deploy: ## Configure et déploie l'application
	PROFILE=$(PROFILE) docker-compose run --rm --entrypoint fixuid php make configure
	rsync -avzm $(RSYNC_PARAMETERS) --exclude-from=./etc/$(PROFILE)/rsync/exclude --include-from=./etc/$(PROFILE)/rsync/include -e "ssh -p $$RSYNC_SSH_PORT" "$$RSYNC_LOCAL_PATH" "$$RSYNC_REMOTE_USER@$$RSYNC_REMOTE_HOST:$$RSYNC_REMOTE_PATH"

directus-export: ## Export des tables Directus de structure
	docker-compose up -d db
	docker-compose exec db mysqldump -proot daheardit directus_collections directus_fields directus_relations | grep -v 'Warning: Using a password on the command line interface can be insecure.' > ./src/data/fixtures/directus_structure.sql

release: database-import release-clean release-archives release-videos-generate release-videos-upload ## Génération des artefacts de la sortie ${RELEASE_SKU}

release-archives: start ## Génération des archives de la sortie
	@if [ -z "$$RELEASE_SKU" ]; then echo "La variable RELEASE_SKU doit être définie"; exit 255; fi
	@if [ ! -d "$${PWD}/src/data/tmp/$$RELEASE_SKU" ]; then echo "Le dossier \"$${PWD}/src/data/tmp/$$RELEASE_SKU\" n'existe pas"; exit 255; fi
	docker-compose run --rm php ./symfony dhr:release --includeExtensions=jpg,png,pdf,txt --archives --db --streamables --sourceExtension="$${SOURCE_EXTENSION:-flac}" "data/tmp/$$RELEASE_SKU" "$$RELEASE_SKU"
	docker-compose exec db mysqldump -proot daheardit track | grep -v "Warning: Using a password on the command line interface can be insecure." > /tmp/track.sql
	ssh daheardit-record@ftp.pastis-hosting.net 'mysql -udaheardit-record -pdaheardit-reco daheardit-record' < /tmp/track.sql
	rm /tmp/track.sql

release-clean: ## Suppression des artefacts de la sortie
	@if [ -z "$$RELEASE_SKU" ]; then echo "La variable RELEASE_SKU doit être définie"; exit 255; fi
	rm -rf ./src/web/assets/releases/$$RELEASE_SKU/archives/* ./src/web/assets/releases/$$RELEASE_SKU/tracks/* ./src/data/tmp/$$RELEASE_SKU/youtube/**

release-videos-generate: ## Génération des vidéos de chaque track
	rm -rf ./src/data/tmp/$$RELEASE_SKU/youtube/*.mp4
	docker-compose run --rm php ./symfony dhr:generate-videos --sourceExtension="$${SOURCE_EXTENSION:-flac}" ./data/tmp/$$RELEASE_SKU ./data/tmp/$$RELEASE_SKU/youtube $$RELEASE_SKU

release-videos-upload: ## Upload des vidéos sur la chaîne Youtube du label
	docker-compose run --rm -v ${PWD}/etc/$(PROFILE)/youtube-secret.json:/youtube-secret.json php ./symfony dhr:youtube-upload ./data/tmp/$$RELEASE_SKU/youtube $$RELEASE_SKU /youtube-secret.json

start: build ## Démarrage de l'application
	docker-compose up -d

stop: ## Arrêt de l'application
	docker-compose stop

archives:
	@if [ -z "$$RELEASE_SKU" ]; then echo "La variable RELEASE_SKU doit être définie"; exit 255; fi
	@if [ ! -d "$${PWD}/src/web/master/$$RELEASE_SKU" ]; then echo "Le dossier \"$${PWD}/src/web/master/$$RELEASE_SKU\" n'existe pas"; exit 255; fi
	/opt/plesk/php/5.6.40/bin/php -d "date.timezone=Europe/Paris" ./src/symfony dhr:release --includeExtensions=jpg,png,pdf,txt,gif --archives --db --streamables --encoder=ffmpeg --sourceExtension="$${SOURCE_EXTENSION:-flac}" "$${PWD}/src/web/master/$$RELEASE_SKU" "$$RELEASE_SKU"