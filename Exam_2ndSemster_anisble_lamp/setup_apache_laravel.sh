#! /bin/bash

# clone the repo
echo "cloning the repo"
git clone https://github.com/laravel/laravel
sleep 3

# enter into the repo
echo "entering the cloned repo"
cd laravel

# check directory
echo $(pwd)
sleep 3


# rename .env 
echo "rename .env"
mv .env.example .env

# update app_key in .env
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
sleep 3

# install composer dependencies
echo "installing php and composer dependencies"
sudo apt-get install php-xml php- -y
sudo apt install php-cli php-json php-common curl php-mbstring php-zip unzip php-curl php-xml -y
sleep 3

# install composer
echo "installing composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# update the repo
echo "install repo depencies"
composer install

# update the repo
composer update

# populate the db
# php artistan migrate --seed

# server the application on port:8000
# php artisan serve

# disable the default apache page
echo "disable default apache page"
sudo a2dissite 000-default.conf

# navigate to sites-availble
echo "navigate to sites-availble"
cd /etc/apache2/sites-available

# check directory
echo $(pwd)

# create your site file
echo "Create sitename.conf"
sudo touch <site-name>.conf

# update the content
echo "update file"
sudo sed -n 'w <site-name>.conf' <<EOF
<VirtualHost *:80>
    ServerAdmin admin@admin.com
    ServerName <site-name>.local

    DocumentRoot /var/www/<site-name>/public

    <Directory /var/www/<site-name>/public>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/<site-name>-error.log
    CustomLog \${APACHE_LOG_DIR}/<site-name>-access.log combined

    <IfModule mod_dir.c>
        DirectoryIndex index.php
    </IfModule>
</VirtualHost>
EOF


# enable the site
echo "enabling sitename"
sudo a2ensite <site-name>

# create the site directory
echo "create site directory"
sudo mkdir -p /var/www/<site-name>

# copy the content to site directory
cd
echo $(pwd)
sudo cp -R laravel/* /var/www/<site-name>/

# go back to the directory
cd /var/www/<site-name>
echo $(pwd)

# set permission for the files
echo "grant permission to files"
sudo chown -R <server-user>:www-data /var/www/<site-name>/
sudo find /var/www/<site-name>/ -type f -exec chmod 664 {} \;
sudo find /var/www/<site-name>/ -type d -exec chmod 775 {} \;
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache

# done
echo 'webserver is up vist http://127.0.0.1 to view website'