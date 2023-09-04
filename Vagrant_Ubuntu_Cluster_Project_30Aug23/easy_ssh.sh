#!/bin/bash

# Check if the SSH key pair doesn't exist
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

# Copy the public key to the slave node
ssh-copy-id -i ~/.ssh/id_rsa.pub altschool@192.168.56.4

# Test SSH connection
ssh altschool@192.168.56.3 "echo SSH connection established successfully."
