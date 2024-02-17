FROM nginx:latest
COPY app /var/www/html
COPY nginx_config/.htpasswd /etc/nginx/.htpasswd
COPY nginx_config/site.conf /etc/nginx/conf/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


