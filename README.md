# Da ! Heard It Records

## Installation d'un environnement de développement

```bash
apt update
apt install -y ant git php-cli
git clone --recursive git@github.com:constructions-incongrues/net.daheardit-records.www.git
cd net.daheardit-records.www
./composer.phar install
ant install
```

## Développement

### Démarrage de la machine virtuelle

```sh
vagrant up
```

Le site est accessible aux adresses suivantes :

- Site, environnement de production : http://daheardit-records.vagrant.dev
- Site, environnement de développement : http://daheardit-records.vagrant.dev/frontend_dev.php
- Backoffice, environnement de production : http://daheardit-records.vagrant.dev
- Backoffice, environnement de développement : http://daheardit-records.vagrant.dev/backend_dev.php

phpMyAdmin est accessible à l'adresse http://daheardit-records.vagrant.dev/phpmyadmin (root / root)

### Rappatriement de la dernière version de la base de données

```sh
ssh daheardit-record@ftp.pastis-hosting.net mysqldump -hmysql.1 -udaheardit-record -p daheardit-record > ./src/data/fixtures/net_dahearditrecords_www.dump.sql
vagrant provision
```

## Déploiement

### sur [preview.daheardit-records.net](http://preview.daheardit-records.net)

```bash
vagrant ssh
ant deploy-to -Dprofile=pastishosting-preview
```

### sur [www.daheardit-records.net](http://www.daheardit-records.net)

```bash
vagrant ssh
ant deploy-to -Dprofile=pastishosting
```

## Publication d'une nouvelle sortie

- `$RELEASE_SKU` = l'identifiant de la sortie. Par exemple : `dhr-21` ou `dhr-32`
- Se placer à la racine des sources du projet
- Créer un dossier de travail qui va contenir tous les fichiers devant faire partie des archives (fichiers audio, images et autres) : `rm -rf ./src/data/tmp/$RELEASE_SKU && mkdir -p ./src/data/tmp/$RELEASE_SKU`
- Dans ce dossier, copier les fichiers audio qui doivent être nommés ainsi : TRACK_NUMBER - TRACK_TITLE.EXTENSION (par exemple : 01 - Waves of Piss.wav ou 10 - Deep Deep Deep.flac)
- Dans ce dossier copier tous les fichiers non-audio supplémentaires : images, textes, etc.

### Génération des archives

- Uploader le dossier de travail sur Pastis Hosting : `rsync -avz --delete-after --progress ./src/data/tmp/$RELEASE_SKU -e 'ssh' daheardit-record@ftp.pastis-hosting.net:/tmp/`
- Se connecter sur Pastis Hosting - `ssh daheardit-record@ftp.pastis-hosting.net`
- Se placer à la racine du projet `cd httpdocs`
- Exécuter la commande de génération des archives (où `$RELEASE_SKU` = l'identifiant de la release : par exemple, `dhr-33`) : `./src/symfony dhr:release --includeExtensions=jpg,png,pdf,txt --archives --db --streamables --sourceExtension=$SOURCE_EXTENSION /tmp/$RELEASE_SKU $RELEASE_SKU` où `$SOURCE_EXTENSION` correspond à l'extension des fichiers sources (`wav` ou `flac`)
- Faire le ménage `rm -r /tmp/$RELEASE_SKU /tmp/dhr_*`

### Publication sur Youtube

- Copier le fichiers JSON de connexion à Youtube dans le dossier `./src/data/tmp` : `cp -v /media/$USER/secrets/daheardit-records.net/*.json ./src/data/tmp/`. Le fichier peut être généré à cette adresse : <https://console.cloud.google.com/iam-admin/serviceaccounts?folder=&organizationId=&project=dahearditrecordsnet>
- Créer un fichier `./src/data/tmp/$RELEASE_SKU/youtube.png` de dimensions 1280x760px
- Démarrer la machine virtuelle : `vagrant up`
- Se connecter à la machine virtuelle : `vagrant ssh`
- Exécuter le script de génération des vidéos : `/vagrant/src/symfony dhr:generate-videos --sourceExtension=${SOURCE_EXTENSION-flac} /vagrant/src/data/tmp/$RELEASE_SKU /vagrant/src/data/tmp/$RELEASE_SKU/youtube $RELEASE_SKU`
- Copier le fichier `youtube.png` : `cp ./src/data/tmp/$RELEASE_SKU/youtube.png ./src/data/tmp/$RELEASE_SKU/youtube/`
- Exécuter le script de publication : `/vagrant/src/symfony dhr:youtube-upload /vagrant/src/data/tmp/$RELEASE_SKU/youtube $RELEASE_SKU /vagrant/src/data/tmp/dahearditrecordsnet_client_secret.json`
- **Supprimer les fichiers de connexion** : `rm /vagrant/src/data/tmp/*.json`
