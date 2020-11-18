FROM nginx:1.19.0-alpine

RUN mv /etc/nginx/conf.d/default.conf \
       /etc/nginx/conf.d/default.conf.bk
    
COPY conf.d/default.conf /etc/nginx/conf.d/
#COPY html/404.html html/50x.html /usr/share/nginx/html/
