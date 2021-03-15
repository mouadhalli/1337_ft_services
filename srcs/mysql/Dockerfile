FROM alpine:3.12

RUN apk update && apk add openrc mariadb mariadb-common mariadb-client bash

COPY init.sh /

RUN chmod +x init.sh

RUN openrc reboot && /etc/init.d/mariadb setup

COPY srcs/mariadb-server.cnf /etc/my.cnf.d

COPY srcs/create_tables.sql .
COPY srcs/wp_db.sql .

EXPOSE 3306

ENTRYPOINT ["sh", "/init.sh"]