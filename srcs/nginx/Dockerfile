FROM alpine:3.12

RUN apk update
RUN apk add nginx sudo bash openssl openssh \
    && apk add openrc --no-cache 

RUN mkdir /www
RUN mkdir /run/nginx
RUN mkdir /etc/nginx/ssl

COPY srcs/default.conf /etc/nginx/conf.d
COPY srcs/index.html /www

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=MA/ST=rhamna/L=Bengruir/O=1337/CN=localhost' -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt

COPY srcs/init.sh /
RUN chmod +x init.sh

EXPOSE 80 443 22

ENTRYPOINT ["sh", "/init.sh"]