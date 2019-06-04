FROM nginx:stable

LABEL maintainer="info@optimum-web.com"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y supervisor procps net-tools cron apache2-utils \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY supervisord/nginx.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY auto-letsencrypt /opt/auto-letsencrypt
RUN chmod +x /opt/auto-letsencrypt

CMD ["/usr/bin/supervisord -n"]
