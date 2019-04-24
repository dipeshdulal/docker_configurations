# php fpm for running scripts (php installation)
FROM php:7.2-fpm

RUN apt-get update && \
    apt-get install -y \
        libmcrypt-dev \
        mysql-client  \
        libmagickwand-dev

RUN pecl install imagick
RUN docker-php-ext-enable imagick
RUN pecl install mcrypt-1.0.1
RUN docker-php-ext-enable mcrypt
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

RUN apt-get update && apt-get install -y git unzip wget ntp gnupg 

RUN docker-php-ext-install zip
RUN docker-php-ext-enable zip