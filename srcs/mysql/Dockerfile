FROM alpine:3.12

RUN apk update && apk add openrc mariadb mariadb-common mariadb-client bash

# RUN openrc reboot && /etc/init.d/mariadb setup

COPY srcs/mariadb-server.cnf /etc/my.cnf.d

COPY srcs/create_tables.sql /
COPY srcs/wp_db.sql /

COPY init.sh /
COPY srcs/health.sh /
RUN chmod +x init.sh health.sh

CMD ["sh", "/init.sh"]