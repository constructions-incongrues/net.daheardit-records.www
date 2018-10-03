.PHONY: configure install

# Règles obligatoires

configure: install
	# Configure app
	git submodule update --init --recursive
	ant configure build -Dprofile=docker

install:
	# Install app dependencies (composer, npm, etc)
	./composer.phar install
