# Debug

On first startup the *docker-env.dist* file will be copied to the *docker-env* which will be used.  
Do this manually and edit *docker-env* for your local settings, if you need to change values initally.  

## Xdebug

Xdebug is activated. 
Change the ini settings for f.e. remote_host in the *docker-env* file according to your docker setup.  

In PHPStorm you will need to setup a server, we assume that it is called *docker-sf3*.  
In the Server set the Host you are using, Port will be *8080* and the Debugger is *Xdebug*.  
In the Path Mappings set your root dir to /var/www/html  

Now set some breakpoint and call your site with ide key as GET param or in a cookie.  

Happy debugging :)

## Blackfire

Blackfire client and agent are provided by the official Docker image.  
The probe is integrated in the PHP container.  
Get the Blackfire Bookmarklet and enter your credentials in *docker-env* and thats it.

Happy Profiling :)