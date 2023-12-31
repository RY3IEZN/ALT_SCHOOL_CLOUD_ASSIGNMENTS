#!/bin/bash

# Create the variable'altschool' 
username="altschool"

# Create the user 'altschool' without setting a password
sudo useradd -m -s /bin/bash "$username"

# Add 'altschool' to the 'sudo' group for superuser privileges
sudo usermod -aG sudo "$username"

echo "User 'altschool' has been created and granted superuser privileges."
