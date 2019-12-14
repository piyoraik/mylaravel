FROM php:7.4-fpm-buster

RUN apt-get update \
&& apt-get install -y libzip-dev mariadb-client \
&& docker-php-ext-install zip pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer && \
chmod +x /usr/local/bin/composer

RUN composer global require "laravel/installer"

# RUN cd /var/www/html && \
# composer create-project --prefer-dist laravel/laravel hook "5.8.*"

ADD ./html /var/www/html

ADD ./php/php.ini /usr/local/etc/php/conf.d/php.ini

RUN cd /var/www/html && \
chmod 777 -R ./hook/storage/ ./hook/bootstrap/