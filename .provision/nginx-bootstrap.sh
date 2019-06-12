#!/bin/bash

echo "=====>  bootstraping NGINX  <====="
# updates repo database
sudo apt-get -q update
# adds apt-add-repo command for ppa(s)
sudo apt-get -qq install software-properties-common
# adds the repo for nginx (stable)
sudo add-apt-repository ppa:nginx/stable
sudo apt-get -qq update 
# installs nginx quietly
sudo apt-get -y -q install nginx

# checks status of nginx server
#sudo systemctl status nginx

# construct two sites and their folders
echo "-----> making site 1 <-----"
sudo mkdir -p /var/www/domain1.com
cd /var/www/domain1.com
sudo mkdir images style.css
echo "<!DOCTYPE html> <html lang='en' dir='ltr'> <head> <meta charset='utf-8'> <title>Welcome to domain1.com</title> <link rel='stylesheet' href='style.css'/> </head> <body> <h1 style='color:green;text-align:center;'>Success! domain1.com home page!</h1> </body> </html>" > index.html
sudo chown -R www-data: /var/www/domain1.com

echo "-----> making site 2 <-----"
sudo mkdir -p /var/www/domain2.net
cd /var/www/domain2.net
sudo mkdir images style.css
echo "<!DOCTYPE html> <html lang='en' dir='ltr'> <head> <meta charset='utf-8'> <title>Welcome to domain2.net</title> <link rel='stylesheet' href='style.css'/> </head> <body> <h1 style='color:green;text-align:center;'>Success! domain2.net home page!</h1> </body> </html>" > index.html
sudo chown -R www-data: /var/www/domain2.net

# set up server blocks
echo "-----> setting up server blocks <------"
sudo cp /vagrant/.provision/sites-avail/domain1.com /etc/nginx/sites-available/domain1.com
sudo cp /vagrant/.provision/sites-avail/domain2.net /etc/nginx/sites-available/domain2.net

# enable server blocks and restart nginx
echo "----->  enable both server blocks <-----"
sudo ln -s /etc/nginx/sites-available/domain1.com /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/domain2.net /etc/nginx/sites-enabled/

# check config of web server
echo " **** ---->  check configuration of server setup  <---- **** "
sudo nginx -t
echo " **** ---->  restart nginx  <---- **** "
sudo systemctl restart nginx
# checks status of nginx server
#sudo systemctl status nginx