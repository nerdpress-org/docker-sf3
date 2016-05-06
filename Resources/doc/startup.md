## Startup options

Setup environment, start all containers and display logs in stdout:  

    ./docker/docker.sh

If you want be logged in automatically use:  

    ./docker/docker.sh -l

This will log you into the `sf_web` container as _www-data_    
and shutdown all containers when you log out.
    
To manually log in the container run
 
     docker exec -it -u www-data sf_web bash
     
or use the shortcut:
 
     ./docker/docker-ssh.sh 
     

To start te container up into the background use:

    ./docker/docker.sh -d