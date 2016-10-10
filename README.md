# Installation d'un environnement de développement

```bash
apt update
apt install -y ant git php-cli
git clone git@github.com:constructions-incongrues/net.daheardit-records.www.git
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
