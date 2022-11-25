#!/bin/bash

while ! mysql -hmariadb -u$MARIADB_USER -p$MARIADB_PASSWORD > /dev/null 2>&1; do echo "Waiting database..."; sleep 5; done

chown -R nginx:nginx /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	wp core download --version=5.3 --locale=fr_FR --allow-root
	wp config create --dbname=$MARIADB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOST --allow-root
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PWD --allow-root
fi

if [ -f /var/www/html/wp-config.php ]; then
	echo 'Launching Wordpress'
	echo "\t\t----- WordPress ready ! -----"
	exec "$@"
fi
