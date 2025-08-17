#!/bin/bash
# This script is intended to be run on a Linux system to provision software.
# sleep until the instacne is ready
until [[-f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 5
done

# install nginx
sudo apt-get update
sudo apt-get install -y nginx
# start nginx service
sudo systemctl start nginx
# enable nginx to start on boot
sudo systemctl enable nginx     