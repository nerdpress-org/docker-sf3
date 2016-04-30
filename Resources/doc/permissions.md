## Permissions

This projects aims to avoid permission problems with symfony running inside docker    
by changing the user id of the _www-data_ user to the current host user id.

This should work on linux, mac or windows systems.

For running symfony commands via cli, log into the _sf_web_ container as _www-data_