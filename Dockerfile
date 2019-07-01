FROM nginx:stable

LABEL maintainer="info@optimum-web.com"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y supervisor procps net-tools cron apache2-utils \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY supervisord/nginx.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY security.conf /etc/nginx/conf.d/security.conf
COPY auto-letsencrypt /opt/letsencrypt/letsencrypt-auto
RUN chmod +x /opt/letsencrypt/letsencrypt-auto

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
