#!/bin/bash
sudo apt-get upgrade -y
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl enable apacahe2
sudo chmod 777 /var/www
sudo chmod 777 /var/www/html/index.html
echo "Hello World CHIRAG RATHI  OM from $(hostname -f)" > /var/www/html/index.html

//aws mai vertical scale up easy process hai:-
1 stop ec2 instances
2 select ec2 instance click action and Choose "Instance Settings" -> "Change Instance Type".
3 choose instance type and save
4 select ec2 instance and again start then proper working Ec2 instance. 