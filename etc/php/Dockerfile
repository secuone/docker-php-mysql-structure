FROM php:8.3-apache

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Update system and install dependencies
RUN apt-get update -y && \
    apt-get install -y git \
    apt-transport-https \
    gnupg

# Install necessary PHP extensions
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo mysqli pdo_mysql

# Clean up apt-get cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure PHP extensions
RUN docker-php-ext-configure pcntl --enable-pcntl && \
    docker-php-ext-install pcntl

# Clean PHP cache
RUN rm -rf /tmp/*

WORKDIR /app
COPY php.ini /usr/local/etc/php/php.ini
