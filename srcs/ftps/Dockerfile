FROM alpine:3.12

RUN apk add vsftpd openssl openrc
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=MA/ST=rhamna/L=Bengruir/O=1337/CN=vsftpd' -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt

RUN mkdir -p /home/admin
RUN adduser admin -D && echo "admin:123" |chpasswd
RUN chmod 750 /home/admin && chown -R admin: /home/admin
COPY srcs/init.sh /
COPY srcs/health.sh /
RUN chmod +x init.sh health.sh

CMD ["sh", "/init.sh"]