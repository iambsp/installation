#!/bin/bash

########################################################
##### USE THIS FILE IF YOU LAUNCHED AMAZON LINUX 2 #####
########################################################

# get admin privileges
sudo su

# install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello BSP from $(hostname -f)" > /var/www/html/index.html


#!/bin/sh

sudo su
apt update -y
apt install default-jre -y
apt install default-jdk -y
apt install openjdk-8-jdk -y
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
echo "Hello BSP from $(hostname -f)" > /var/www/html/index.html


