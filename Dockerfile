FROM openresty/openresty:alpine

RUN \
    # Create nginx group & user
    addgroup -g 1000 nginx && \
    adduser -u 1000 -G nginx -s /sbin/nologin -H -D nginx

EXPOSE 8080
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ADD src/lua /usr/local/openresty/nginx/conf/lua

RUN chgrp -R 1000 /usr/local/openresty/nginx/ && \
    chmod -R g=u /usr/local/openresty/nginx/

USER nginx
