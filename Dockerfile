FROM alpine:3.7

MAINTAINER alexusfree <alexusfree@gmail.com>

ENV TIMEZONE  Asia/Yekaterinburg
#ENV SUBNET_IP 192.168.0.0/16
#ENV Exclude_EXIT_NODES {RU}, {UA}, {BY}, {KZ}, {UZ}

RUN echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    #apk update && \
    #apk upgrade && \
    apk --no-cache add --update curl tzdata tor@edge && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    apk --no-cache del tzdata && \
    chmod 700 /var/lib/tor && \
    rm -rf /var/cache/apk/*

# && echo 'User tor' > /etc/tor/torrc \
# && echo 'SOCKSPort 0.0.0.0:9050' >> /etc/tor/torrc \
# && echo 'DNSPort 0.0.0.0:5300' >> /etc/tor/torrc \
# && echo 'VirtualAddrNetworkIPv4 10.0.0.0/8' >> /etc/tor/torrc \
# && echo 'AutomapHostsOnResolve 1' >> /etc/tor/torrc \
# && echo 'ExcludeExitNodes {RU}, {UA}, {BY}, {KZ}, {UZ} ' >> /etc/tor/torrc \

EXPOSE 9050/tcp 5300/udp

COPY torrc /etc/tor/

USER tor
CMD /usr/bin/tor -f /etc/tor/torrc
#CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]
