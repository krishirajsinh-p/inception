FROM alpine:3.19

RUN	apk update && \
    apk add --no-cache nginx openssl && \
    rm -f /var/cache/apk/*; \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/certs/kpuwar.42.fr.crt \
       -keyout /etc/ssl/private/kpuwar.42.fr.key \
       -subj "/C=DE/ST=BW/L=HN/O=42School/OU=42HN/CN=kpuwar/"

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/http.d/nginx.conf

EXPOSE 443

CMD	["nginx", "-g", "daemon off;"]
