#! /bin/bash

# clone the repo
echo "cloning the repo"
git clone https://github.com/laravel/laravel
sleep 5

# enter into the repo
echo 
cd laravel

# check directory
echo $(pwd)
sleep 5


# rename .env 
mv .env.example .env

new_key=base64:ZXYwcmV1bGVhcjZ3N2NzdjJybzFiZzJ0cTU0ZnU3a2k=
# Check if the new key is not empty
if [ -n "$new_key" ]; then
    # Update the APP_KEY in the .env file
    sed -i "s/APP_KEY=.*/APP_KEY=$new_key/" .env

    echo "Updated APP_KEY in .env with the following key:"
    echo "$new_key"
else
    echo "Failed to retrieve a new key from the website."
fi

# install composer dependencies
sudo apt-get install php-xml php-curl -y
sudo apt install php-cli php-json php-common curl php-mbstring php-zip unzip zip unzip php-curl php-xml -y
sleep 5

# install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# update the repo
composer install

# update the repo
composer update

# populate the db
# php artistan migrate --seed

# disable the default apache page
sudo a2dissite 000-default.conf

# navigate to sites-availble
cd /etc/apache2/sites-available

# check directory
echo $(pwd)

# create your site file
sudo touch laravel.conf

# update the content
sudo sed -n 'w laravel.conf' <<EOF
<VirtualHost *:80>
    ServerAdmin uneku@ejig.com
    ServerName laravel.local

    DocumentRoot /var/www/laravel/public

    <Directory /var/www/laravel/public>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/laravel-error.log
    CustomLog \${APACHE_LOG_DIR}/laravel-access.log combined

    <IfModule mod_dir.c>
        DirectoryIndex index.php
    </IfModule>
</VirtualHost>
EOF


# enable the site
sudo a2ensite laravel

# create the site directory
sudo mkdir -p /var/www/laravel

# copy the content to site directory
cd /home/vagrant
echo $(pwd)
sudo cp -r laravel/. /var/www/laravel/

# go back to the directory
cd /var/www/laravel
echo $(pwd)

# set permission for the files
sudo chown -R vagrant:www-data /var/www/laravel/
sudo find /var/www/laravel/ -type f -exec chmod 664 {} \;
sudo find /var/www/laravel/ -type d -exec chmod 775 {} \;
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache

# reload apache
sudo systemctl reload apache2

# done
echo 'webserver is up vist http://127.0.0.1 to view website'