# Docker image of php7 with pinba extension

This image contains the following extensions: 
- php7-fpm
- php7-mbstring
- php7-iconv
- php7-mysqli
- php7-gd
- php7-json
- php7-memcached
- php7-mcrypt
- php7-amqp
- php7-xdebug
- php7-zip
- php7-xml
- php7-bcmath
- php7-curl
- php7-phar
- php7-zlib
- php7-pear
- php7-soap
- php7-pcntl
- php7-ctype
- php7-posix
- php7-fileinfo
- php7-session
- php7-imagick
- php7-opcache
- php7-zip
- php7-dev
- php7-openssl
- php7-redis
- php7-pgsql
- php7-intl
- php7-gmp
- php7-dom
- php7-tokenizer

# Setup

1. Install [Docker](http://docker.io).

# Usage

Start *docker image*:

```bash
$ docker run -d --name php7 vendelev/php7-pinba
```

By default, the PHP exposes 9000 port.

For example, you can use the following nginx configuration:
```
server {
    charset utf-8;
    listen  80;

    server_name site.local;
    root        /var/www/web;
    index       index.php;

    location / {
        # Redirect everything that isn't a real file to index.php
        try_files $uri $uri/ /index.php?$args;
    }

    location ~ \.php$ {
        fastcgi_pass localhost:9000;
        include fastcgi_params;
        fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTPS $https if_not_empty;
        try_files $uri =404;
    }
}
```
