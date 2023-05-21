FROM debian:buster

ARG DB_NAME
ARG DB_UP
ARG DB_USER
ARG DB_RP

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    mariadb-server

RUN mkdir -p /var/run/mysql

RUN chown -R mysql:mysql /var/run/mysql

RUN service mysql start \
    &&  mysql -u root -e   "CREATE DATABASE IF NOT EXISTS $DB_NAME; \
                        ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_RP'; \
                        GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_UP'; \
                        FLUSH PRIVILEGES;"

COPY ./conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["mysqld", "--bind-address=0.0.0.0"]

