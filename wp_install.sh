echo "Domain Name (eg. example.com)?"
read DOMAIN


sudo mkdir /var/www/"$DOMAIN"
cd /var/www/"$DOMAIN"
sudo su -c 'echo "<?php phpinfo(); ?>" |tee info.php'
cd ~
wget wordpress.org/latest.zip
unzip latest.zip
mv /root/wordpress/* /var/www/"$DOMAIN"/
rm -rf wordpress latest.zip

echo "Nginx server installation completed"
sleep 2;
cd ~
sudo chown www-data:www-data -R /var/www/"$DOMAIN"
sudo systemctl restart nginx.service
