#!/usr/bin/env bash

upOption="-d"
login=true
optspec=":n"
while getopts "$optspec" optchar; do
    case "${optchar}" in
        n)
             echo "->No Login mode" >&2
             login=false
             upOption=''
            ;;
    esac
done

containerName="sf_web"

##Update Apache UID
uid=$(id -u)
if [ $uid -gt 100000 ]; then
	uid=1000
fi

sed "s/\$USER_ID/$uid/g" ./docker/apache-php/Dockerfile.dist > ./docker/apache-php/Dockerfile

##build and launch containers
docker-compose build
docker-compose up $upOption

if [ $login = true ]; then
	docker exec -it -u www-data $containerName bash
	docker-compose stop
fi

