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

# Déploiement

## sur www.daheardit-records.net

```bash
ant deploy-to -Dprofile=pastishosting
```
