#!/bin/bash

# Check if the SSH key pair doesn't exist
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

# Copy the public key to the slave node
ssh-copy-id -i ~/.ssh/id_rsa.pub altschool@your_slave_ip

# Test SSH connection
ssh altschool@your_slave_ip "echo SSH connection established successfully."
