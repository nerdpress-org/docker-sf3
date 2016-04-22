# docker-sf3

[![Travis](https://img.shields.io/travis/nerdpress-org/docker-sf3.svg?style=flat-square)](https://travis-ci.org/nerdpress-org/docker-sf3)

Docker advanced LAMP setup w/ Elasticsearch & Memcached for symfony3 development 

## Installation

    git clone https://github.com/nerdpress-org/docker-sf3.git docker-sf3
    cp -r docker-sf3/docker* /path/to/your/symfony-project/
    cd /path/to/your/symfony-project/

## Usage

    ./docker.sh
    
This will build and start all containers and log you into the `sf_web` container as _www-data_    
and shutdown all containers when you log out.
    
If you dont want to be logged in automatically use:  

    ./docker.sh -n
    

### DB

MySql is used.  
Use the name of the service as the database host in your connection settings:

```yml
database_driver:   pdo_mysql
database_host:     db 
database_port:     ~
database_name:     sf3
database_user:     sf3
database_password: root
```



Its configured to be open for access from outside,  
so if you prefer to use MySql Workbench on the host, use the containers IP as host.  
Find the IP with: `docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' $(docker ps -q)`

Otherwise use phpmyadmin on http://[yourhost*]:8081

\* [yourhost] is *localhost* if you are on Linux,  
*local.docker* if you are using dlite or the IP of the VM that runs docker
