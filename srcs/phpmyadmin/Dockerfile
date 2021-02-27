FROM alpine:3.12

RUN apk update && apk add nginx && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
    && apk add php7-fpm php7-mcrypt php7-soap php7-session php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip \
    && apk add sudo && apk add bash \
    && apk add openrc --no-cache && apk add libc6-compat

RUN mkdir /www
RUN mkdir /run/nginx

COPY srcs/default.conf /etc/nginx/conf.d
COPY srcs/index.html /www

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip
RUN unzip phpMyAdmin-5.0.4-all-languages.zip
RUN rm phpMyAdmin-5.0.4-all-languages.zip
RUN mv phpMyAdmin-5.0.4-all-languages/ /www/phpMyAdmin

COPY srcs/init.sh /

RUN chmod +x init.sh

EXPOSE 5000

ENTRYPOINT ["sh", "/init.sh"]