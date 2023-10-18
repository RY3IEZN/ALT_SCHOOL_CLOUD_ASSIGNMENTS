#! /bin/bash

# clone the repo
echo "cloning the repo"
git clone https://github.com/laravel/laravel

# enter into the repo
cd laravel

# check directory
echo pwd

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
sudo apt-get install php-xml php- -y
sudo apt install php-cli php-json php-common curl php-mbstring php-zip unzip php-curl php-xml -y

# install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# update the repo
composer install

# update the repo
composer update

# populate the db
# php artistan migrate --seed

# server the application on port:8000
php artisan serve