FROM alpine:3.5
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /hostsecv2.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
 && mkdir /usr/bin/hostsecv2 /etc/hostsecv2 \
 && touch /etc/hostsecv2/hostconfig.json \
 && unzip /hostsecv2.zip -d /usr/bin/hostsecv2 \
 && rm -rf /hostsecv2.zip /usr/bin/hostsecv2/*.sig /usr/bin/hostsecv2/doc /usr/bin/hostsecv2/*.json /usr/bin/hostsecv2/*.dat /usr/bin/hostsecv2/sys* \
 && chgrp -R 0 /etc/hostsecv2 \
 && chmod -R g+rwX /etc/hostsecv2
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
EXPOSE 8080
