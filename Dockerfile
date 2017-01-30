FROM axiles89/php-fpm:latest

ENV TERM=xterm

COPY ./etc/fpm/pool.d/www.conf /etc/php/7.0/fpm/pool.d/www.conf