# Da ! Heard It Records

## Utilisation

## Édition du contenu

L'interface de gestion du contenu du site est disponible à l'adresse <https://data.constructions-incongrues.net/admin/#/daheardit-records/>.

## Génération des archives et vidéos d'une sortie (avec Jean-Cloude)

### Archives

- Dans le dossier https://vip.jeancloude.club/f/1228551 créer un dossier `dhr-SKU` (remplacer `dhr-SKU` par le numéro de catalogue de la sortie. Par exemple : `dhr-59`)
- Copier les fichiers audio qui doivent être nommés ainsi : `TRACK_NUMBER - TRACK_TITLE.EXTENSION` (par exemple : `01 - Waves of Piss.wav` ou 10 - Deep Deep Deep.flac`)
- Copier tous les autres fichiers devant faire partie des archives (images et autres)
- Modifier puis copier la commande `cd httpdocs ; RELEASE_SKU=dhr-SKU SOURCE_EXTENSION=EXTENSION make archives` (remplacer `dhr-SKU` par le numéro de catalogue de la sortie - par exemple : `dhr-59` - et `EXTENSION` par l'extension des fichiers du master - par exemple : `aif`)
- Ouvrir un terminal en cliquant sur le lien suivant : https://plesk.pastis-hosting.net:8443/modules/ssh-terminal/?dom_id=63&site_id=63
- Coller la commande dans le terminal

### Vidéos

- Dans le dossier `dhr-SKU` précdemment créé, créer un dossier `youtube` et y placer un fichier `youtube.png` de dimensions 1280px x 760px
- Modifier puis copier la commande `cd httpdocs ; RELEASE_SKU=dhr-SKU SOURCE_EXTENSION=EXTENSION make videos` (remplacer `dhr-SKU` par le numéro de catalogue de la sortie - par exemple : `dhr-59` - et `EXTENSION` par l'extension des fichiers du master - par exemple : `aif`)
- Ouvrir un terminal en cliquant sur le lien suivant : https://plesk.pastis-hosting.net:8443/modules/ssh-terminal/?dom_id=63&site_id=63
- Coller la commande dans le terminal

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

### Vider le cache 

https://dash.cloudflare.com/bb7602930482a97a4a403a52a17cb524/daheardit-records.net/caching/configuration ("Purge Everything")
