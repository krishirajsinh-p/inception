FROM alpine:3.16

ARG DB_NAME \
    MYSQL_USER \
    MYSQL_PASS

RUN apk update && apk add --no-cache php8 php8-fpm \
    php8-mysqli php8-json php8-curl php8-dom php8-exif \
    php8-fileinfo php8-mbstring php8-openssl php8-xml \
    php8-zip wget unzip && rm -f /var/cache/apk/*; \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php8/php-fpm.d/www.conf

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

COPY ./requirements/wordpress/conf/wp-config-create.sh .

RUN sh wp-config-create.sh && \
    rm wp-config-create.sh && \
    chmod -R 0777 wp-content/

CMD ["/usr/sbin/php-fpm8", "-F"]
