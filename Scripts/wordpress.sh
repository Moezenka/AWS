#!/bin/bash

# INSTALL WP - EDIT DBNAME
yum update -y
yum install -y httpd php-mysqlnd
amazon-linux-extras install -y php7.2
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
yum install php-mbstring -y
systemctl restart httpd
systemctl restart php-fpm
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz -P /var/www/html
mkdir /var/www/html/phpMyAdmin && tar -xvzf /var/www/html/phpMyAdmin-latest-all-languages.tar.gz -C /var/www/html/phpMyAdmin --strip-components 1
rm  -rf /var/www/html/phpMyAdmin-latest-all-languages.tar.gz
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm -rf latest.tar.gz
cp wordpress/wp-config-sample.php wordpress/wp-config.php
sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', 'wordpressdb' );/g " wordpress/wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', 'wordpressuser' );/g " wordpress/wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', 'wordpresspassword' );/g " wordpress/wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'wordpressdbIP' );/g " wordpress/wp-config.php
curl https://api.wordpress.org/secret-key/1.1/salt/ > salt.txt
sed '49,56d' wordpress/wp-config.php
cat salt.txt | tee -a wordpress/wp-config.php
rm -rf salt.txt
rm -rf tee
cp -r wordpress/* /var/www/html/
rm -rf wordpress
sed -i '151s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
chown -R apache /var/www
chgrp -R apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
systemctl restart httpd
systemctl enable php-fpm
systemctl restart php-fpm
