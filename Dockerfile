FROM phpswoole/swoole:latest

WORKDIR /var/www

COPY . .

RUN curl -sLS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

RUN docker-php-ext-install pcntl

RUN composer install

CMD ["php", "artisan", "octane:start", "--server=swoole", "--host=0.0.0.0", "--port=8000","--task-workers=60"]

EXPOSE 8000
