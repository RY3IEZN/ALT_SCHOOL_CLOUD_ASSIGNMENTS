#!/bin/bash

#displat the linux type in use
lsb_release -a

# Update package index
sudo apt update

# Install Apache
sudo apt install -y apache2

# Install MySQL and secure installation
sudo apt install -y mysql-server

# Install PHP and required modules
sudo apt install -y php

# Restart Apache
sudo systemctl restart apache2

# Start Apache
sudo systemctl start apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

# enable phpinfo page
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/phpinfo.php

# Restart Apache
sudo systemctl restart apache2

echo "LAMP stack installation completed."
