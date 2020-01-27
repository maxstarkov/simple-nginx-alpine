FROM alpine

RUN apk update && apk add nginx && adduser -D -g 'www' www
RUN mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www && mkdir /run/nginx && chown www:www /run/nginx

COPY ["nginx.conf", "/etc/nginx"]
COPY ["index.html", "/www"]

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
