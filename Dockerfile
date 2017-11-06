FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add wget && \
    rm -rf /var/cache/apk/*

RUN brook_new_ver=`wget -qO- https://github.com/txthinking/brook/tags| grep "/txthinking/brook/releases/tag/"| head -n 1| awk -F "/tag/" '{print $2}'| sed 's/\">//'` && \
    wget --no-check-certificate -N "https://github.com/txthinking/brook/releases/download/${brook_new_ver}/brook"

COPY brook /brook
	
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]