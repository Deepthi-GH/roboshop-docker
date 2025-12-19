#!/bin/bash
if [ -f /tmp/mysql-root-password.txt ] 
then 
    PASSWORD=$(cat /tmp/mysql-root-password.txt)
    echo "Accessed MYSQL root passowrd"
else
    echo "File not found"
    exit 1
fi   

export MYSQL_ROOT_PASSWORD=$PASSWORD
rm -rf /tmp/mysql-root-password.txt
exec /entrypoint.sh mysqld
