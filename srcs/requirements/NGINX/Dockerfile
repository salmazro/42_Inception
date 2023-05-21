FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
 -out /etc/ssl/nginx-selfsigned.crt -subj "/CN=salmazro.42.fr/O=42AD/L=Abu Dhabi/ST=Abu Dhabi/C=AE"

COPY /conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/' /etc/nginx/sites-enabled/nginx.conf

EXPOSE 443

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["nginx", "-g", "daemon off;"]
