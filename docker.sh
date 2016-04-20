#!/usr/bin/env bash

containerName="sf_web"

##Update Apache UID
uid=$(id -u)
if [ $uid -gt 100000 ]; then
	uid=1000
fi
#sed "s|RUN chown -R .*:www-data /var/www/.ssh$|RUN chown -R $uid:www-data /var/www/.ssh|" ./docker/apache-php/Dockerfile.dist > ./docker/apache-php/Dockerfile
#sed "s|RUN usermod -u .* www-data -s /bin/bash$|RUN usermod -u $uid www-data -s /bin/bash|" ./docker/apache-php/Dockerfile.dist > ./docker/apache-php/Dockerfile

sed "s/\$USER_ID/$uid/g" ./docker/apache-php/Dockerfile.dist > ./docker/apache-php/Dockerfile

##build and launch containers
docker-compose build
docker-compose up -d

docker exec -it -u www-data $containerName bash

docker-compose stop