# Debug

On every startup the *docker-env.dist* file will be copied to the *docker-env* which will be used.
When copying, the remote\_host is set for xdebug.

## Xdebug

Xdebug is activated. 
- In PHPStorm settings:
  - Languages & Frameworks > PHP > Debug: 
    - Port 9000
  - you will need to setup a server, we assume that it is called *docker-sf3*.  
    - In the Server set the Host you are using, Port will be *8080* and the Debugger is *Xdebug*.
    - In the path mappings set your root dir to /var/www/html  
  - Create a new *Debug Configuration* as *PHP Web Application*
    - select your default browser and enter `/app_dev.php` as Start URL (or any other path you want as start path)

Now set some breakpoint and call your site with ide key as GET param or in a cookie.
- When you click the green Bug (or `ctrl+f5` per default) a new Browser Window should open with `?XDEBUG_SESSION_START={RANDOMINT}`
- You can stop the debugging session by calling your site with `?XDEBUG_SESSION_STOP` attached as GET parameter.

Happy debugging :)

## Blackfire

Blackfire client and agent are provided by the official Docker image.  
The probe is integrated in the PHP container.  
Get the Blackfire Bookmarklet and enter your credentials in *docker-env* and thats it.

Happy Profiling :)
