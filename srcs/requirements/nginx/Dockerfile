FROM    debian:buster

RUN     apt-get update && \
        apt-get -y install nginx openssl && \
        mkdir -p /var/www/html && \
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt \
        -subj "/C=KR/L=Default City/O=Default Company Ltd/CN=*.lesstif.com"

COPY    ./conf/default /etc/nginx/sites-available/default
RUN     chmod 777 /etc/ssl/certs/server.crt
RUN     chmod 777 /etc/ssl/private/server_pkey.pem

ENTRYPOINT ["nginx", "-g", "daemon off;"]

EXPOSE 443