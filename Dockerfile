FROM php:7.2-alpine

RUN apk update &&	apk add git zip curl 
RUN apk add libpng-dev openssh openssl

RUN docker-php-ext-install bcmath iconv gd mysqli mbstring pdo_mysql zip
RUN docker-php-ext-enable bcmath gd mysqli pdo_mysql sodium

# Global install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php && \
	mv composer.phar /usr/local/bin/composer && \
	php -r "unlink('composer-setup.php');"

# Global install deployer
RUN curl -LO https://deployer.org/deployer.phar && \
	mv deployer.phar /usr/local/bin/dep && \
	chmod +x /usr/local/bin/dep

