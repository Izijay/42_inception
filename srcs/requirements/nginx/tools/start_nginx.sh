#!bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/CN=mdupuis.42.fr"
fi
echo "\t\t----- SSL certif created ! -----"
exec "$@"
