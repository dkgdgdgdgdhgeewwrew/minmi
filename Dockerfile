FROM alpine:edge

ARG AUUID="c982f14f-a62a-49d9-a9c7-859366e45de2"
ARG CADDYIndexPage="https://codeload.github.com/openwrt/openwrt/zip/refs/heads/master"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
