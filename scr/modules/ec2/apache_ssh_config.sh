#!/bin/bash
#Author: michael_kedey
#Date: 9/10/2023
#Last_modified: 9/10/2023
#Purpose: install apache and change the default ssh port from 22 to 270
#Use_case: user file to run on boot after a new ec2 has been instantaited

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

echo '<h1>Congrats! you have installed apache</h1>' > var/www/html/index.html

# Change the SSH port to 273
new_port=273
sudo sed -i "s/^#Port 22/Port $new_port/" /etc/ssh/sshd_config
#sudo sed -i 's/Port 22/Port 273/' /etc/ssh/sshd_config
sudo systemctl restart sshd
#sudo ufw allow $new_port/tcp
