FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
	mariadb-server \
	mariadb-client
	
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql

COPY tools/start_db.sh /tmp/start_db.sh
COPY conf/init.sql /tmp/init.sql

ENTRYPOINT ["sh", "/tmp/start_db.sh"]