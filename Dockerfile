FROM nginx:1.10.1-alpine

MAINTAINER Amos Sejour

COPY src/html usr/share/nginx/html

CMD [ "nginx", "-g", "daemon off;" ]
