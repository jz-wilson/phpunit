# Set the base image for subsequent instructions
FROM php:7.2

# Update packages
RUN apt-get update && \
# Install PHP and composer dependencies
    apt-get install -qq git curl libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev sqlite3 libsqlite3-dev && \
# Clear out the local repository of retrieved package files
    apt-get clean
# Install needed extensions
# Here you can install any other extension that you need during the test and deployment process
RUN pecl install xdebug && \
    docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql opcache sockets
# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

