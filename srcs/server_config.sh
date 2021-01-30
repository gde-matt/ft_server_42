mkdir var/www/localhost

cp /root/nginx_test.conf /etc/nginx/sites-available/default

cp /root/info.php /var/www/localhost

# PHPMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
tar -xzvf phpMyAdmin-5.0.2-english.tar.gz && rm -rf phpMyAdmin-5.0.2-english.tar.gz
mv phpMyAdmin-5.0.2-english /var/www/localhost/phpmyadmin
cp /root/config.sample.inc.php /var/www/localhost/phpmyadmin/config.inc.php


#PHPMyAdmin SuperUser configuration
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'gde-matt'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'gde-matt'@'localhost' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
