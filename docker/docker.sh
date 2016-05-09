#!/usr/bin/env bash

upOption=""
login=false
optspec=":ld"
while getopts "$optspec" optchar; do
    case "${optchar}" in
        l)
             echo "->Login after start up" >&2
             login=true
             upOption="-d"
            ;;
    esac
    case "${optchar}" in
        d)
             echo "->Start up to background" >&2
             upOption="-d"
            ;;
    esac
done

containerName="sf_web"

##Update Apache UID
uid=$(id -u)
if [ $uid -gt 100000 ]; then
	uid=1000
fi

sed "s/\$USER_ID/$uid/g" ./apache-php/Dockerfile.dist > ./apache-php/Dockerfile

if [ ! -e ./docker-env ]; then
    cp ./docker-env.dist ./docker-env
fi

##build and launch containers
docker-compose build
docker-compose up $upOption

if [ $login = true ]; then
	docker exec -it -u www-data $containerName bash
	docker-compose stop
fi

