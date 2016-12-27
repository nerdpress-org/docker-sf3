```asciidoc
██████╗  ██████╗  ██████╗██╗  ██╗███████╗██████╗       ███████╗███████╗██████╗ 
██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗      ██╔════╝██╔════╝╚════██╗
██║  ██║██║   ██║██║     █████╔╝ █████╗  ██████╔╝█████╗███████╗█████╗   █████╔╝
██║  ██║██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗╚════╝╚════██║██╔══╝   ╚═══██╗
██████╔╝╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║      ███████║██║     ██████╔╝
╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝      ╚══════╝╚═╝     ╚═════╝ 
                                                                               
```

## docker-sf3 - advanced LAMP setup for symfony3 development
[![Travis](https://img.shields.io/travis/nerdpress-org/docker-sf3.svg?style=flat-square)](https://travis-ci.org/nerdpress-org/docker-sf3)

permission-hassle free <sup>:tm:</sup> [» More](/Resources/doc/permissions.md)

## Installation

    git clone https://github.com/nerdpress-org/docker-sf3.git docker-sf3
    cp -r docker-sf3/docker /path/to/your/symfony-project/
    cd /path/to/your/symfony-project/docker


## Usage

    ./docker.sh -l
    
This will build and start all containers and log you into the symfony container as _www-data_.  
[» More startup options ](Resources/doc/startup.md)

![console](Resources/doc/console.jpg)

Open the browser: [http://[docker-host]:8080](http://[docker-host]:8080) 

### PHP

PHP7 is used.  

Xdebug and Blackfire.io support are included by default.   
[» How to configure](Resources/doc/debug.md) 

### DB

MySql is used.  
Use the name of the service as the database host in your connection settings:

```yml
database_driver:   pdo_mysql
database_host:     db
database_port:     3306
database_name:     sf3
database_user:     sf3
database_password: sf3
```

Its configured to be open for access from outside,  
so if you prefer to use MySql Workbench on the host, use the containers IP as host.  
Find the IP with: `docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' $(docker ps -q)`

Otherwise use phpmyadmin on [http://[docker-host]:8081](http://[docker-host]:8081) 

### Other Services

* [Elasticsearch](Resources/doc/services.md) 
* [Mailcatcher SMTP](Resources/doc/services.md) 
