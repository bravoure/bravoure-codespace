FROM mcr.microsoft.com/devcontainers/php:8-bullseye

LABEL "org.opencontainers.image.source"="https://github.com/bravoure/bravoure-codespace"

# Install MariaDB and other deps
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
	apt-get install -y mariadb-client imagemagick libmagickwand-dev libzip-dev libicu-dev && \
	apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN pecl install imagick && \
	docker-php-ext-enable imagick

# Install php-extensions
RUN docker-php-ext-configure intl && \
	docker-php-ext-install mysqli pdo pdo_mysql zip intl bcmath

# rebuild
