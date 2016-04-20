# docker-sf3
Docker setup for existing symfony3 projects

`git clone https://github.com/nerdpress-org/docker-sf3.git docker-sf3`   
`cp -r docker-sf3/docker* /path/to/your/symfony-project/`   
`cd /path/to/your/symfony-project/`
`sh docker.sh`

Docker setup for new symfony3 projetcts

`git clone https://github.com/nerdpress-org/docker-sf3.git my-new-project`
`cd my-new-project`
`sh docker.sh`


## DB
MySql is used.  
Its configured to be open for access from outside,  
so if you prefer to use MySql Workbench on the host, use the containers IP as host.  

Find the IP with: `docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' $(docker ps -q)`