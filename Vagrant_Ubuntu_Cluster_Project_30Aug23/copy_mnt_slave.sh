#!/bin/bash

# Create the directory /mnt/altschool
sudo mkdir -p /mnt/altschool

# Create a file called passtoslave with the specified content
echo "see you on the other side" | sudo tee /mnt/altschool/content

# Copy the content from master to slave
sudo -u altschool scp -r /mnt/altschool/ altschool@slave:/mnt/altschool/slave/
