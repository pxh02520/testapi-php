FROM php:7.4

RUN apt-get update \
 && apt-get install -y p7zip p7zip-full zip unzip zlib1g-dev libzip-dev
RUN apt-get install -y zlib1g-dev \
 && docker-php-ext-install zip

# install composer
COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

# install phpunit/guzzle
RUN mkdir /app
RUN chmod 0777 -R /app
WORKDIR /app

COPY ./composer.json /app/
RUN composer install

