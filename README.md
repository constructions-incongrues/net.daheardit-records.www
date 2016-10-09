# Installation d'un environnement de développement

```bash
sudo apt-get install virtualbox resolvconf dnsmasq
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.8.6_x86_64.deb
sudo dpkg -i vagrant_1.8.6_x86_64.deb
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-share
vagrant plugin install landrush
vagrant up
```

## Déploiement

### sur preview.daheardit-records.net

#### Simulation

```bash
ant deploy -Dprofile=pastishosting-preview -Drsync.option="--dry-run --delete-after"
```

#### Pour de vrai

```bash
ant deploy -Dprofile=pastishosting-preview -Drsync.options="--delete-after"
```

### sur www.daheardit-records.net

#### Simulation

```bash
ant deploy -Dprofile=pastishosting -Drsync.option="--dry-run --delete-after"
```

#### Pour de vrai

```bash
ant deploy -Dprofile=pastishosting -Drsync.options="--delete-after"
```
