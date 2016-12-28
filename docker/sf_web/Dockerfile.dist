FROM php:7-apache

#Enable necessary Apache modules
RUN a2enmod rewrite

#Change your timezone below. Full list of timezones: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
RUN echo Europe/Berlin > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

#Append software required during runtime here.
RUN RUNTIME_PKGS="locales zsh curl vim git zip mcrypt mysql-client htop ssh-client libicu52 libjpeg62-turbo libpng12-0 libfreetype6" \
    && apt-get update && apt-get install -y --no-install-recommends $RUNTIME_PKGS \
    && apt-get autoremove -y && apt-get clean -y \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Append software required during build here.
RUN BUILD_PKGS="zlib1g-dev libicu-dev g++ libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev make" \
    && apt-get update && apt-get install -y --no-install-recommends $BUILD_PKGS \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring exif zip opcache pdo_mysql pcntl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apt-get autoremove -y $BUILD_PKGS \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Configure xdebug.
RUN sed -i '1 a xdebug.remote_autostart=true' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.remote_connect_back=1 ' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.remote_enable=1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN sed -i '1 a xdebug.max_nesting_level = 1200' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#Install blackfire.
RUN export VERSION=`php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;"` \
    && curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/${VERSION} \
    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp \
    && mv /tmp/blackfire-*.so `php -r "echo ini_get('extension_dir');"`/blackfire.so \
    && echo "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /usr/local/etc/php/conf.d/blackfire.ini \
    && rm -rf /tmp/* /var/tmp/*

#Install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo \
    && rm -rf /tmp/* /var/tmp/*

#Populate Environment
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY php.ini /usr/local/etc/php/
COPY zshrc.dist /var/www/.zshrc

#Overtake www-data
RUN usermod -u $USER_ID www-data -s /bin/zsh

#Install oh-my-zsh
ENV TERM=xterm
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /var/www/.oh-my-zsh

#Fix permissions and umask
RUN chgrp -R www-data /var/www
RUN chmod -R g+rwx /var/www
RUN umask 0007

WORKDIR /var/www/html
