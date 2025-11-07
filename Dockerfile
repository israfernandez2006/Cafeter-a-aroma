# Usar Ubuntu como imagen base
FROM ubuntu:latest

# Evitar interacciones durante la instalación de paquetes
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar el sistema e instalar Apache y MySQL
RUN apt-get update && apt-get install -y \
    apache2 \
    mysql-server \
    php \
    php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configurar Apache
RUN a2enmod rewrite
RUN service apache2 restart

# Exponer puertos
EXPOSE 80   
EXPOSE 3306 

# Copiar archivos de la web al directorio de Apache
COPY index.html /var/www/html/
COPY styles.css /var/www/html/
COPY actions.js /var/www/html/

# Script de inicio
COPY start-services.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start-services.sh

# Comando para ejecutar al iniciar el contenedor
CMD ["/usr/local/bin/start-services.sh"]