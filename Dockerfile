FROM nginx:1.14.2

LABEL maintainer="info@optimum-web.com"

# no tty for container
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y supervisor
COPY supervisord/nginx.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY auto-letsencrypt /opt/auto-letsencrypt
RUN chmod +x /opt/auto-letsencrypt

CMD ["/usr/bin/supervisord"]
