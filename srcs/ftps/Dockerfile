FROM alpine:3.12

RUN apk add vsftpd openssl openrc
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/init.sh /
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=MA/ST=rhamna/L=Bengruir/O=1337/CN=vsftpd' -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt
EXPOSE 21

ENTRYPOINT ["sh", "/init.sh"]