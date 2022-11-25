FROM debian:buster

RUN apt update && apt -y upgrade && apt -y install \
	php7.3 \
	php-fpm \
	php-mysqli \
	mariadb-client \
	wget

RUN	adduser --system nginx && addgroup --system nginx
COPY conf/php-fpm.conf /etc/php/7.3/fpm
COPY conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/start_wp.sh /tmp/start_wp.sh

WORKDIR /var/www/html

ENTRYPOINT ["sh", "/tmp/start_wp.sh"]
CMD ["/usr/sbin/php-fpm7.3"]
