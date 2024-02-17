#Descargamos la última imagen de nginx
FROM nginx:latest
#Copiamos el contenido de la carpeta app a la carpeta /var/www/html
COPY app /var/www/html
#Copiamos el archivo de .htpasswd para poder pedir contraseña al acceder a la página
COPY nginx_config/.htpasswd /etc/nginx/.htpasswd

#Copiamos el archivo de certificado y la clave privada
COPY nginx_config/certs/nginx-selfsigned.crt /etc/nginx/ssl/nginx-selfsigned.crt
COPY nginx_config/certs/nginx-selfsigned.key /etc/nginx/ssl/nginx-selfsigned.key
#Copiamos el archivo de configuración de nginx
COPY nginx_config/site.conf /etc/nginx/conf.d/default.conf

#Exponemos el puerto 80
EXPOSE 80
#Exponemos el puerto 443
EXPOSE 443
#Ejecutamos nginx como servidor web
CMD ["nginx", "-g", "daemon off;"]


