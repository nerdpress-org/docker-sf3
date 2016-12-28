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

## Please Notice

    This software compilation is ment for local development purpose only.

## Usage

    cd /path/to/your/symfony-project/docker
    ./docker.sh -l
    
This will build and start all containers and log you into the symfony container as _www-data_.  
[» More startup options ](Resources/doc/startup.md)

![console](Resources/doc/console.jpg)

Open the browser: [http://[docker-host]:8080](http://[docker-host]:8080) 

![toolbar](Resources/doc/toolbar.png)   


## PHP7 on Apache 2.4 (http2 enabled)

from the [https://launchpad.net/~ondrej](Ondřej Surý PPA)
running on Ubuntu:Xenial.

### Debugging & Tools.

Xdebug and Blackfire.io support are included by default.   
[» How to configure](Resources/doc/debug.md) 

[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is the default shell.

## DB
Official MySQL Docker [https://hub.docker.com/r/mysql/mysql-server/](mysql:5) is used.  
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
Find the IP with: 
    `docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' $(docker ps -q)`

### Otherwise use official phpmyadmin docker on [http://[docker-host]:8081](http://[docker-host]:8081) 

### Other Services

* [Elasticsearch](Resources/doc/services.md) 
* [Mailcatcher SMTP](Resources/doc/services.md) 

### settings
Locale is en_US.UTF-8
Timezone is set to Europe/Berlin



