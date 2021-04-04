FROM alpine:3.12

# TELEGRAPH
ENV TELEGRAF_V 1.18.0
ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_V}_linux_amd64.tar.gz ./
RUN tar xf telegraf-${TELEGRAF_V}_linux_amd64.tar.gz && \
        chmod +x telegraf-1.18.0/* && \
        cp /telegraf-1.18.0/usr/bin/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf-1.18.0/

# INFLUXDB
RUN apk add influxdb bash libc6-compat
#CONF FILES
RUN mkdir /etc/telegraf
COPY /srcs/telegraf.conf /etc/telegraf
COPY /srcs/influxdb.conf /etc

COPY srcs/setup.sh /
COPY srcs/health.sh /
RUN chmod +x setup.sh health.sh
CMD ["sh", "setup.sh"]