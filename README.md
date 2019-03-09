# Da ! Heard It Records

## Utilisation

## Génération des artefacts d'une nouvelle sortie

Paramètres :

- **`RELEASE_SKU`** : La référence catalogue de la sortie (eg. `dhr-40`)
- **`SOURCE_EXTENSION=flac`** : L'extension des fichiers audio dans le dossier `./src/data/tmp/${RELEASE_SKU}/`

Regrouper les fichiers sources de la sortie :

- Créer un dossier de travail qui va contenir tous les fichiers devant faire partie des archives (fichiers audio, images et autres) : `rm -rf ./src/data/tmp/${RELEASE_SKU} && mkdir -p ./src/data/tmp/$RELEASE_SKU`
- Dans ce dossier copier les fichiers audio qui doivent être nommés ainsi : TRACK_NUMBER - TRACK_TITLE.EXTENSION (par exemple : 01 - Waves of Piss.wav ou 10 - Deep Deep Deep.flac)
- Dans ce dossier copier tous les fichiers non-audio supplémentaires : images, textes, etc.

il faut ensuite invoquer la règle `release` qui va :

- Générer les fichiers audio destinés au streaming
- Générer les archives Flac et MP3
- Générer les vidéos de chacune des tracks de la sortie
- Uploader les sus-dites vidéos sur la chaîne Youtube du label

Par exemple :

```sh
RELEASE_SKU=dhr-666 SOURCE_EXTENSION=wav make release
```

Une fois cette étape terminée, il ne reste plus qu'à déployer les fichiers qui ont été générés.

### Déploiement en production

- Prévisualisation :

```sh
make deploy
```

- Déploiement effectif :

```sh
make deploy RSYNC_PARAMETERS=""
```

## Développement

### Installation des dépendances

docker, docker-compose, git, make

### Récupération des sources

```sh
git clone git@github.com:constructions-incongrues/net.daheardit-records.www.git
```

### Construction des images Docker

```sh
make build
```

### Démarrage de l'application

```sh
make start
```

Cette commande rend disponibles les URL suivantes :

- <http://adminer.daheardit.localhost> : Une interface de gestion de la base de données
- <http://daheardit.localhost> : Le site internet de Da ! Heard It Records
- <http://directus.daheardit.localhost> : L'interface d'administration du site internet

### Arrêt de l'application

```sh
make stop
```

### Attachement des flux locaux au container du site internet

```sh
make attach
```

### Rappatriement de la base de données de production

```sh
make database-import
```

### Export de la base de données Directus

```sh
make directus-export
```

## Documentation legacy à mettre à jour

#### Publication sur Youtube

- Copier le fichiers JSON de connexion à Youtube dans le dossier `./src/data/tmp` : `cp -v /media/$USER/secrets/daheardit-records.net/*.json ./src/data/tmp/`. Le fichier peut être généré à cette adresse : <https://console.cloud.google.com/iam-admin/serviceaccounts?folder=&organizationId=&project=dahearditrecordsnet>
- Créer un fichier `./src/data/tmp/$RELEASE_SKU/youtube.png` de dimensions 1280x760px
- Démarrer la machine virtuelle : `vagrant up`
- Se connecter à la machine virtuelle : `vagrant ssh`
- Exécuter le script de génération des vidéos : `/vagrant/src/symfony dhr:generate-videos --sourceExtension=${SOURCE_EXTENSION-flac} /vagrant/src/data/tmp/$RELEASE_SKU /vagrant/src/data/tmp/$RELEASE_SKU/youtube $RELEASE_SKU`
- Copier le fichier `youtube.png` : `cp ./src/data/tmp/$RELEASE_SKU/youtube.png ./src/data/tmp/$RELEASE_SKU/youtube/`
- Exécuter le script de publication : `/vagrant/src/symfony dhr:youtube-upload /vagrant/src/data/tmp/$RELEASE_SKU/youtube $RELEASE_SKU /vagrant/src/data/tmp/dahearditrecordsnet_client_secret.json`
- **Supprimer les fichiers de connexion** : `rm /vagrant/src/data/tmp/*.json`
