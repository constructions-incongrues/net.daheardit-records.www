# Da ! Heard It Records

## Utilisation

## Édition du contenu

L'interface de gestion du contenu du site est disponible à l'adresse <https://ivresse.constructions-incongrues.net>.

## Génération des artefacts d'une nouvelle sortie

Paramètres :

- **`RELEASE_SKU`** : La référence catalogue de la sortie (eg. `dhr-40`)
- **`SOURCE_EXTENSION=flac`** : L'extension des fichiers audio dans le dossier `./src/data/tmp/${RELEASE_SKU}/`

Regrouper les fichiers sources de la sortie :

- Créer un dossier de travail qui va contenir tous les fichiers devant faire partie des archives (fichiers audio, images et autres) : `rm -rf ./src/data/tmp/${RELEASE_SKU} && mkdir -p ./src/data/tmp/$RELEASE_SKU`
- Dans ce dossier copier les fichiers audio qui doivent être nommés ainsi : `TRACK_NUMBER - TRACK_TITLE.EXTENSION` (par exemple : `01 - Waves of Piss.wav ou 10 - Deep Deep Deep.flac`)
- Dans ce dossier copier tous les fichiers non-audio supplémentaires : images, textes, etc.
- Dans ce dossier créer un dossier `youtube` et y placer un fichier `youtube.png` qui sera utilisé pour la génération des vidéos

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
make deploy RSYNC_PARAMETERS=
```

## Développement

### Installation des dépendances

```sh
sudo apt-get install docker docker-compose git make
```

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

- <http://admin.daheardit.localhost> : L'interface d'administration du site, fournie par [Directus](https://docs.directus.io/guides/user-guide.html)
  - Identifiants : `admin@daheadit.localhost` / `admin`
- <http://adminer.daheardit.localhost> : Une interface de gestion de la base de données, fournie par [Adminer](https://www.adminer.org)
  - Identifiants : `root` / `root`
- <http://api.daheardit.localhost> : L'API du site fournie par [Directus](https://docs.directus.io/api/reference.html)
- <http://daheardit.localhost> : Le site internet de Da ! Heard It Records
- <http://traefik.daheardit.localhost> : L'interface d'administration du reverse proxy [Traefik](https://docs.traefik.io/)

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
