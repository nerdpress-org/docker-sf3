#!/usr/bin/env bash

containerName="sf_web"

##Update Apache UID
uid=$(id -u)
if [ $uid -gt 100000 ]; then
	uid=1000
fi

sed "s/\$USER_ID/$uid/g" ./docker/apache-php/Dockerfile.dist > ./docker/apache-php/Dockerfile

##build and launch containers
docker-compose build
docker-compose up -d

docker exec -it -u www-data $containerName bash

docker-compose stop
