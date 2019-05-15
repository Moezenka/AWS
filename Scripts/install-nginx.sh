#!/bin/bash

# Uppdatera Repo
yum update -y

# Installera Nginx 1.12
amazon-linux-extras install nginx1.12 -y

# Rename index.html>backupindex.html
mv /usr/share/nginx/html/index.html /usr/share/nginx/html/backupindex.html

# Skapa index.html
touch /usr/share/nginx/html/index.html

# Custom index.html
echo "<html><H1>Mohsen</H1></html>" > /usr/share/nginx/html/index.html

# Installera yum-cron för automatiska updates
yum install yum-cron -y

#stresstest
yum install stress -y

# Start & Enable
systemctl enable yum-cron

#systemctl start yum-cron

# Enable autoupdates, editera conf
sed -i 's/apply_updates = no/apply_updates = yes/g' /etc/yum/yum-cron.conf

# Autostarta Nginx
systemctl enable nginx

# Restarta Nginx
systemctl restart nginx

# Add job to crontab, cp local files to bucket
echo "*/5 * * * * root aws s3 sync --delete /usr/share/nginx/html s3://vahebi-nginx-s3 --region eu-west-1" >> /etc/crontab

# Restart crontab
systemctl restart crond

# END