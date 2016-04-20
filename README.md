# docker-sf3
Docker advanced LAMP+ES setup for symfony3 development


`git clone https://github.com/nerdpress-org/docker-sf3.git docker-sf3`   
`cp -r docker-sf3/docker* /path/to/your/symfony-project/`   
`cd /path/to/your/symfony-project/`   
`sh docker.sh`   


## DB
MySql is used.  
Its configured to be open for access from outside,  
so if you prefer to use MySql Workbench on the host, use the containers IP as host.  
Find the IP with: `docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' $(docker ps -q)`

Otherwise use phpmyadmin on http://[yourhost*]:8081

\* [yourhost] is *localhost* if you are on Linux,  
*local.docker* if you are using dlite or the IP of the VM that runs docker