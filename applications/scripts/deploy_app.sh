#!/bin/bash
# This script is executed as user data on the EC2 instance

# Install Node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Deploy your Node.js app here
