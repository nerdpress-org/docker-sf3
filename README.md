# docker-sf3

[![Travis](https://img.shields.io/travis/nerdpress-org/docker-sf3.svg?style=flat-square)](https://travis-ci.org/nerdpress-org/docker-sf3)

Docker advanced LAMP setup w/ Elasticsearch for symfony3 development 

## Permissions

This projects aims to avoid permission problems with symfony running inside docker    
by changing the user id of the _www-data_ user to the current host user id.

This should work on linux, mac or windows systems.

For running symfony commands via cli, log into the _sf_web_ container as _www-data_

## Installation

    git clone https://github.com/nerdpress-org/docker-sf3.git docker-sf3
    cp -r docker-sf3/docker* /path/to/your/symfony-project/
    cd /path/to/your/symfony-project/

## Usage

    ./docker.sh
    
This will build and start all containers, all logs are send to stdout.  

Open the browser: http://[yourhost*]:8080

If you want be logged in automatically use:  

    ./docker.sh -l

This will log you into the `sf_web` container as _www-data_    
and shutdown all containers when you log out.
    
To manually log in the container run
 
     docker exec -it -u www-data sf_web bash
     
or use the shortcut:
 
     ./docker-ssh.sh 
     

To start te container up into the background use:

    ./docker.sh -d
    
### PHP

PHP7 is used.  

#### Xdebug

Xdebug is activated. 
Change the ini settings for f.e. remote_host in the .env file according to your docker setup.  

In PHPStorm you will need to setup a server, we assume that it is called *docker-sf3*.  
In the Server set the Host you are using, port will be 8080 and the Debugger is Xdebug.  
In the Path Mappings set your root dir to /var/www/html  

Now set some breakpoint and call your site with ide key as GET param or in a cookie.  
Happy debugging :)

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

### Other Services

#### Elasticsearch

```yml
host: elasticsearch
port: 9200
```

### Footnotes

\* [yourhost] is *localhost* if you are on Linux,  
*local.docker* if you are using dlite or the IP of the VM that runs docker
