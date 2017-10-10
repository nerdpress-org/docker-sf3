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

case "$(uname -s)" in
    Linux*) host_ip="172.17.0.1";;
    Darwin*) host_ip=$(dlite status | grep dns_server | grep -oE "[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}");;
esac

sed "s/\$USER_ID/$uid/g" ./sf_web/Dockerfile.dist > ./sf_web/Dockerfile
sed "s/\$HOST_IP/$host_ip/g" ./sf_web/docker-env.dist > ./sf_web/docker-env


##build and launch containers
docker-compose build
docker-compose up $upOption

##add ssh folder to enable access to private repos
docker cp --follow-link ~/.ssh $containerName:/var/www/
docker exec $containerName chown -R www-data /var/www/.ssh

##make ssh files accessable for www-data
docker exec -it $containerName chown -R www-data:www-data /var/www/.ssh

##composer selfupdate
docker exec -it $containerName composer selfupdate

if [ $login = true ]; then
	docker exec -it -u www-data $containerName zsh
	docker-compose stop
fi

