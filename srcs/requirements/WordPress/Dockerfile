FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    curl less php php-fpm php-mysql php-mysqli mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress

EXPOSE 9000

COPY /tools/wordpress_config.sh /tmp

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN apt-get install -y dumb-init

RUN mkdir -p /run/php/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

WORKDIR /var/www/html/wordpress

# CMD ["sh", "/tmp/wordpress_config.sh"]
# CMD chmod u+x /tmp/wordpress_config.sh
CMD ["sh", "/tmp/wordpress_config.sh"]
