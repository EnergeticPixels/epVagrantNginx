Energetic Pixels' NGINX
=======================

A simple little Vagrant box for running NGINX (so far)

1. Install VirtualBox 4.0.
2. Install Vagrant (min version 2)
3. Clone this repo to local folder on your hard-drive
4. Using a terminal window, change directory to your new local folder (step 3)
5. Using the same terminal window, type "vagrant up --provision"

NGINX default sample html file can be rendered from your host computer's browser at
```
http://127.0.0.1:3001
```

To have your host computer's browser have access to domain1.com and domain2.net sites, you will need to modify your HOSTS file.  You will need to add the two domain names and point them to localhost's IP address of 127.0.0.1.  You can find the HOSTS file on a MS Windows system in C:/Windows/System32/drivers/etc folder.  You will need admin privileges to save any changes.
