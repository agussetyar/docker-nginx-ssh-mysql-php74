Docker Container for NGINX, SSH, MariaDB (MySQL) and PHP 7.4

A Dockerfile that installs the Ubuntu 20.04 with openssh-server, nginx, mariadb-server, php7.4.

## Usage
```
$ git clone https://github.com/agussetyar/docker-nginx-ssh-mysql-php74
$ cd docker-nginx-ssh-mysql-php74
$ docker-compose build && docker-compose up -d
```

You can SSH to your container on 127.0.0.1:7767
```
$ ssh localheartz@localhost -p 7767
```

You can then visit the following URL in a browser on your host machine to get started:
```
http://127.0.0.1:7768
```

You can also connect to MySQL container on 127.0.0.1:7769
```
$ mysql -h localhost -P 7769 -u root -p
Enter password: [Enter your MYSQL_ROOT_PASSWORD]
```

To get the MySQL's password, check the top of the docker container logs for it:
```
$ docker logs [container_id]
220520 19:43:06 mysqld_safe Logging to syslog.

220520 19:43:06 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql

mysql root password: [Your MYSQL_ROOT_PASSWORD]
```