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
echo "<!DOCTYPE html> <html> <head> <title>Vagrant/Nginx Test</title> </head> <body> <h1>Welcome to Anthony's vagrant/nginx test.</h1> <p>Planet provided by Vangel Tzo</p> <div class='container'> <!-- stars --> <div class='star star-1'></div> <div class='star star-2'></div> <div class='star star-3'></div> <!-- clouds --> <div class='cloud-group-1'> <div class='cloud cloud-1'></div> <div class='cloud cloud-2'></div> <div class='cloud cloud-3'></div> <div class='cloud cloud-4'></div> <div class='cloud cloud-5'></div> <div class='cloud cloud-6'></div> </div> <div class='cloud-group-2'> <div class='cloud cloud-1'></div> <div class='cloud cloud-2'></div> <div class='cloud cloud-3'></div> <div class='cloud cloud-4'></div> <div class='cloud cloud-5'></div> <div class='cloud cloud-6'></div> </div> <div class='cloud-group-3'> <div class='cloud cloud-1'></div> <div class='cloud cloud-2'></div> <div class='cloud cloud-3'></div> <div class='cloud cloud-4'></div> <div class='cloud cloud-5'></div> <div class='cloud cloud-6'></div> </div> <!-- orbits --> <div class='orbit orbit-1'></div> <div class='orbit orbit-2'></div> <div class='orbit orbit-3'></div> <div class='orbit orbit-4'></div> <div class='orbit orbit-5'></div> <div class='orbit orbit-6'></div> <!-- main planet --> <div class='ring-before'></div> <div class='ring-bigger-before'></div> <div class='planet'></div> <div class='ring-after'></div> <div class='ring-bigger-after'></div> <!-- sub planet --> <div class='sub-planet'></div> </div> </body> <footer> <style> body { background: #fafaf0; font-family: Avenir, Roboto, 'Helvetica Neue', sans-serif; } h1, h2, h3, p { text-align: center; } .container { position: relative; width: 300px; height: 300px; margin: 100px auto; background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab); background-size: 400% 400%; animation: daylight 15s ease infinite; border-radius: 50%; border: 10px solid white; overflow: hidden; box-shadow: 0 0 20px rgba(0, 0, 0, 0.3), inset 0 0 0 15px rgba(0, 0, 0, 0.05), inset 0 0 0 30px rgba(0, 0, 0, 0.05), inset 0 0 0 45px rgba(0, 0, 0, 0.05), inset 0 0 0 60px rgba(0, 0, 0, 0.05), inset 0 0 0 75px rgba(0, 0, 0, 0.05), inset 0 0 0 90px rgba(0, 0, 0, 0.05); } .planet { position: absolute; top: 50%; left: 50%; z-index: 2; width: 120px; height: 120px; background: linear-gradient( to bottom, #fecf4e 1%, #a62a44 50%, #310441 100% ); border-radius: 50%; transform: rotate(-15deg) translate(-35%, -55%); } @supports not (clip-path: inset(50% 0 0 0)) { .ring-before, .ring-after, .ring-bigger-before, .ring-bigger-after { display: none; } } .ring-before, .ring-after, .ring-bigger-before, .ring-bigger-after { content: ''; width: 126px; height: 42px; border-radius: 50%; border: 3px solid rgba(248, 197, 77, 0.8); position: absolute; top: 125px; left: 84px; transform: skew(-54deg); } .ring-bigger-before, .ring-bigger-after { transform: skew(-54deg) scale(1.3); border-color: #d3bc68; } .ring-before, .ring-bigger-before { z-index: 3; clip-path: inset(50% 0 0 0); } .ring-after, .ring-bigger-after { z-index: 1; clip-path: inset(0 0 50% 0); } .sub-planet { position: absolute; top: 24%; left: 75%; z-index: 4; width: 35px; height: 35px; background: linear-gradient( to bottom, #70a27d 1%, #4552a1 50%, #371a6a 100% ); border-radius: 50%; transform: rotate(-15deg); } .orbit { width: 2px; height: 2px; background: white; border-radius: 50%; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9; } .orbit-1 { animation: orbit-1 5s linear infinite; } @keyframes orbit-1 { from { transform: rotate(0deg) translateX(65px) rotate(0deg); } to { transform: rotate(360deg) translateX(65px) rotate(-360deg); } } .orbit-2 { animation: orbit-2 10s linear infinite; } @keyframes orbit-2 { from { transform: rotate(0deg) translateX(80px) rotate(0deg); } to { transform: rotate(360deg) translateX(80px) rotate(-360deg); } } .orbit-3 { animation: orbit-3 15s linear infinite; } @keyframes orbit-3 { from { transform: rotate(0deg) translateX(95px) rotate(0deg); } to { transform: rotate(360deg) translateX(95px) rotate(-360deg); } } .orbit-4 { animation: orbit-4 20s linear infinite; } @keyframes orbit-4 { from { transform: rotate(0deg) translateX(110px) rotate(0deg); } to { transform: rotate(360deg) translateX(110px) rotate(-360deg); } } .orbit-5 { animation: orbit-5 25s linear infinite; } @keyframes orbit-5 { from { transform: rotate(0deg) translateX(125px) rotate(0deg); } to { transform: rotate(360deg) translateX(125px) rotate(-360deg); } } .orbit-6 { animation: orbit-6 30s linear infinite; } @keyframes orbit-6 { from { transform: rotate(0deg) translateX(140px) rotate(0deg); } to { transform: rotate(360deg) translateX(140px) rotate(-360deg); } } .cloud { background: #f1f1f1; width: 100px; height: 30px; position: absolute; border-radius: 50%; bottom: -5px; box-shadow: 0 0 40px rgba(0, 0, 0, 0.1); } .cloud:before, .cloud:after { content: ''; background: #f1f1f1; border-radius: 50%; position: absolute; } .cloud:before { width: 50px; height: 50px; bottom: 2px; left: 5px; } .cloud:after { width: 40px; height: 40px; bottom: 2px; right: 15px; } .cloud-group-1, .cloud-group-2, .cloud-group-3 { position: absolute; bottom: 0; width: 211px; height: 100px; opacity: 0.2; } .cloud-group-1 { bottom: -5px; } .cloud-group-2 { transform: scale(2); bottom: 20px; left: -50px; } .cloud-group-3 { transform: scale(3); bottom: 100px; left: -24px; } .cloud-2 { left: 10px; } .cloud-3 { right: 10px; } .cloud-4 { right: 184px; bottom: 0; } .cloud-5 { right: 24px; bottom: 12px; } .cloud-6 { right: -45px; bottom: 9; } .star { position: absolute; left: 0; top: 50px; width: 1px; height: 1px; background-color: white; animation: shooting 5s linear infinite; } .star:before { content: ''; position: absolute; width: 100px; height: 1px; right: 1px; top: 0; background: linear-gradient( to right, transparent 0%, rgba(255, 255, 255, 0.4) 100% ); } .star-2 { top: 100px; animation: shooting 8s 1s linear infinite; } .star-3 { top: 250px; animation: shooting 3s 2s linear infinite; } @keyframes daylight { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } } @keyframes shooting { from { left: -100px; } to { left: calc(100% + 100px); } } </style> </footer> </html>" > index.html
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