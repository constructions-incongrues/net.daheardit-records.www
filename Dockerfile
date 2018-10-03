# Any *-apache image listed on this page : https://store.docker.com/images/php
FROM php:5-fpm-alpine

# Install additional packages and PHP extensions
RUN apk --update --no-cache add apache-ant bash openssh-client curl freetype-dev git libjpeg-turbo-dev libpng-dev make zip \
    && docker-php-ext-install -j$(nproc) opcache pdo_mysql \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

# Install gosu
# https://github.com/tianon/gosu
RUN curl -L "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" > /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

# Installs Dockito Vault ONVAULT utility
# https://github.com/dockito/vault
RUN curl -L https://raw.githubusercontent.com/dockito/vault/master/ONVAULT > /usr/local/bin/ONVAULT && \
    chmod +x /usr/local/bin/ONVAULT

# Create dedicated user and group
RUN adduser -s /bin/bash -g "" -D -u 1000 -g 1000 app

# Copy application sources to container
COPY --chown=app:app ./ /usr/local/src/app
COPY etc/docker/php.ini /usr/local/etc/php/php.ini

# Define default working directory
WORKDIR /usr/local/src/app

# Authorize github host key
RUN gosu app mkdir /home/app/.ssh && gosu app echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/app/.ssh/config

# Build application
RUN gosu app ONVAULT make configure