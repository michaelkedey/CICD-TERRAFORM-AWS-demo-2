#!/bin/bash
#Author: michael_kedey
#Date: 9/10/2023
#Last_modified: 9/10/2023
#Purpose: install apache and change the default ssh port from 22 to 270
#Use_case: user file to run on boot after a new ec2 has been instantaited

sudo -i
sudo apt-get upgrade && sudo apt-get update -y
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systmectl restart apache2

echo "<h1>Congrats, you have installed apache siuccesfully</h1>" > /var/www/html/index.html
sudo systemctl restart apache2

sudo sed -i 's/Port 22 /Port 270/' /etc/ssh/sshd_config

sudo  systemctl restart ssh


