#!/bin/bash

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};
FLUSH PRIVILEGES;
USE ${DB_NAME};
CREATE USER '${USER_ID}'@'%' IDENTIFIED BY '${USER_PASSWORD}';
GRANT ALL PRIVILEGES ON * TO '${USER_ID}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" > sql

mysql_install_db --user=root
mysqld -uroot --bootstrap < sql
mysqld -uroot