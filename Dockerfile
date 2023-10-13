FROM tangramor/nginx-php8-fpm:php8.2.2_node19.6.0

# Этап 1: Установка js-зависимостей
WORKDIR /app
COPY . /app
#RUN ls -l
#RUN npm install
#RUN composer install --no-dev --optimize-autoloader

WORKDIR /app/resources/js
RUN ls -l
#RUN npm install
#RUN npm run build

#WORKDIR /
#COPY . .

# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

#CMD ["chmod +x 00-laravel-deploy.sh"]
#CMD ["/00-laravel-deploy.sh"]
CMD ["/start.sh"]
