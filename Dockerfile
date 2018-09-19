FROM alpine:latest

MAINTAINER alexusfree <alexusfree@gmail.com>

ENV TIMEZONE  Asia/Yekaterinburg
#ENV SUBNET_IP 192.168.0.0/16


RUN apk update && apk upgrade && apk add bash python curl tzdata tor
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo "${TIMEZONE}" > /etc/timezone && apk del tzdata

EXPOSE 9050
EXPOSE 9051

RUN rm /var/cache/apk/*

ADD ./torrc /etc/tor/torrc

USER tor
CMD /usr/bin/tor -f /etc/tor/torrc
