FROM nginx:1.14.2
COPY nginx.conf /etc/nginx/nginx.conf
COPY auto-letsencrypt /opt/auto-letsencrypt
RUN chmod +x /opt/auto-letsencrypt
