FROM alpine:3.12

RUN apk add openrc mariadb mariadb-common mariadb-client

COPY srcs/mariadb-server.cnf /etc/my.cnf.d

COPY srcs/create_tables.sql /
COPY srcs/wp_db.sql /

COPY init.sh /
COPY srcs/health.sh /
RUN chmod +x init.sh health.sh

CMD ["sh", "/init.sh"]