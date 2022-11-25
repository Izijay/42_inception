USE mysql;
UPDATE user SET password=PASSWORD('$MYSQL_ROOT_PWD') WHERE User='root' AND Host = 'localhost';

FLUSH PRIVILEGES;

CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO root@'%' IDENTIFIED BY '$MYSQL_ROOT_PWD';


FLUSH PRIVILEGES;
