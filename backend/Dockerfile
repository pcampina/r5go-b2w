FROM php:7.2-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

COPY php.ini-development /usr/local/etc/php/php.ini-development

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apk update && apk upgrade && \
  apk add \
  --no-cache bash git openssh

RUN apk add --update --no-cache \
  freetype-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" gd

RUN apk add --no-cache zip libzip-dev
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip
