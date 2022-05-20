#!/bin/bash

# mysql setup
if [ ! -f /setup.txt ]; then
  #mysql has to be started this way as it doesn't work to call from /etc/init.d
  /usr/bin/mysqld_safe &
  /usr/bin/sleep 10

  # This is so the passwords show up in logs.
  echo mysql root password: $MYSQL_ROOT_PASSWORD
  echo $MYSQL_ROOT_PASSWORD > /mysql-root-pw.txt
  echo "SETUPOK" > /setup.txt

  /usr/bin/mysqladmin -u root password $MYSQL_ROOT_PASSWORD
  /usr/bin/mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  /usr/bin/killall mysqld
fi

# start all the services
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf