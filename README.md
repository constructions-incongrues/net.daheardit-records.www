# Installation d'un environnement de développement

```bash
apt update
apt install -y ant git php-cli
git clone --recursive git@github.com:constructions-incongrues/net.daheardit-records.www.git
cd net.daheardit-records.www
./composer.phar install
ant install
```

# Développement

## Démarrage de la machine virtuelle

```
vagrant up
```

Le site est accessible aux adresses suivantes :

- Site, environnement de production : http://daheardit-records.vagrant.dev
- Site, environnement de développement : http://daheardit-records.vagrant.dev/frontend_dev.php
- Backoffice, environnement de production : http://daheardit-records.vagrant.dev
- Backoffice, environnement de développement : http://daheardit-records.vagrant.dev/backend_dev.php

phpMyAdmin est accessible à l'adresse http://daheardit-records.vagrant.dev/phpmyadmin (root / root)

## Modification des données de la base de données de développement

Les données de la base sont déclarées dans le fichier src/data/fixtures/fixtures.yml.
Une fois que ce fichier a été modifié, il faut recharger les données à l'aide de la commande suivante :

```bash
vagrant provision
```

# Déploiement

## sur [preview.daheardit-records.net](http://preview.daheardit-records.net)

```bash
ant deploy-to -Dprofile=pastishosting-preview
```

## sur [www.daheardit-records.net](http://www.daheardit-records.net)

```bash
ant deploy-to -Dprofile=pastishosting
```

## Publication d'une nouvelle sortie

- $RELEASE_SKU = l'identifiant de la sortie. Par exemple : `dhr-21` ou `dhr-32`
- Créer un dossier qui va contenir tous les fichiers devant faire partie des archives (fichiers audio, images et autres) : `rm -r /tmp/$RELEASE_SKU && mkdir /tmp/$RELEASE_SKU`
- Dans ce dossier, copier les fichiers audio qui doivent être nommés ainsi : TRACK_NUMBER - TRACK_TITLE.EXTENSIONK (par exemple : 01 - Waves of Piss.wav ou 10 - Deep Deep Deep.flac)
- Dans ce dossier copier tous les fichiers non-audio supplémentaires : images, textes, etc.
- Uploader ce dossier sur Pastis Hosting : `rsync -avz --delete-after /tmp/$RELEASE_SKU -e ssh daheardit-record@ftp.pastis-hosting.net:/tmp/`
- Se connecter sur Pastis Hosting - `ssh -p 2222 daheardit-record@ftp.pastis-hosting.net`
- Se placer à la racine du projet `cd httpdocs`
- Exécuter la commande de génération des archives (où $SKU = l'identifiant de la release : par exemple, dhr-33) : `./src/symfony dhr:release --includeExtensions=png --archives --db --streamables --sourceExtension=$SOURCE_EXTENSION /tmp/$RELEASE_SKU $RELEASE_SKU` où SOURCE_EXTENSION correspond à l'extension des fichiers sources (`wav` ou `flac`)
