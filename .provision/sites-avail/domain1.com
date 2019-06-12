server {
  listen 80;
  listen [::]:80;

  root /var/www/domain1.com;

  index index.html index.htm;

  server_name domain1.com www.domain1.com;

  location / {
    try_files $uri $uri/ =404;
  }
}