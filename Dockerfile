FROM php:7.4.6-fpm-alpine3.11

WORKDIR /var/www

# install mysql libs
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

RUN rm -rf /var/www/html

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install dependencies
#RUN composer install && \
#	cp .env.example .env && \
#	php artisan key:generate && \
#	php artisan config:cache

COPY . /var/www

RUN ln -s public html

EXPOSE 9000
ENTRYPOINT ["php-fpm"]
