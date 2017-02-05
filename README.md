# Docker image of php7 with pinba extension

This image contains the following extensions: 
 - php7.0-fpm
 - php7.0-amqp
 - php7.0-curl
 - php7.0-gd
 - php7.0-geoip
 - php7.0-gmp
 - php7.0-imagick
 - php7.0-intl
 - php7.0-json
 - php7.0-mbstring
 - php7.0-mcrypt
 - php7.0-memcached
 - php7.0-mongodb
 - php7.0-mysql
 - php7.0-opcache
 - php7.0-pgsql
 - php7.0-readline
 - php7.0-redis
 - php7.0-soap
 - php7.0-sqlite3
 - php7.0-xml
 - php7.0-yaml
 - php7.0-zip
 - php7.0-xdebug

# Setup

1. Install [Docker](http://docker.io).

# Usage

Start *docker image*:

```bash
$ docker run -d --name php7 vendelev/php7-pinba
```

By default, the PHP exposes 9004 port.

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
        fastcgi_pass localhost:9004;
        include fastcgi_params;
        fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTPS $https if_not_empty;
        try_files $uri =404;
    }
}
```