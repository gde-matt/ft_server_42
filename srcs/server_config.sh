#!/bin/bash

mkdir var/www/localhost

cp /root/nginx_test.conf /etc/nginx/sites-available/default

cp /root/info.php /var/www/localhost

# PHPMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
tar -xzvf phpMyAdmin-5.0.2-english.tar.gz && rm -rf phpMyAdmin-5.0.2-english.tar.gz
mv phpMyAdmin-5.0.2-english /var/www/localhost/phpmyadmin
cp /root/config.sample.inc.php /var/www/localhost/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/localhost/phpmyadmin


#PHPMyAdmin SuperUser configuration
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'gde-matt'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'gde-matt'@'localhost' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root



# WordPress
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz && rm -rf latest.tar.gzf latest.tar.gz
cp /root/wp-config.php wordpress/wp-config.php
mv wordpress /var/www/localhost/

# WordPress Database User
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'gde-matt'@'localhost' IDENTIFIED BY 'password';"| mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root



# Configuring SSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42/OU=gde-matt/CN=localhost" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt
chmod 600 /etc/ssl/private/nginx-selfsigned.key /etc/ssl/certs/nginx-selfsigned.crt
