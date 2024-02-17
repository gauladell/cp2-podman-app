#Descargamos la última imagen de nginx
FROM nginx:latest
#Copiamos el contenido de la carpeta app a la carpeta /var/www/html
COPY app /var/www/html
#Copiamos el archivo de .htpasswd para poder pedir contraseña al acceder a la página
COPY nginx_config/.htpasswd /etc/nginx/.htpasswd
#Copiamos el archivo de configuración de nginx
COPY nginx_config/site.conf /etc/nginx/conf/conf.d/default.conf
#Exponemos el puerto 80
EXPOSE 80
#Ejecutamos nginx como servidor web
CMD ["nginx", "-g", "daemon off;"]


