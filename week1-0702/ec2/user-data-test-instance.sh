#!/bin/bash
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo service start apache2
sudo systemctl enable apache2
sudo echo "dodary-Yejin" > /var/www/html/index.html
EOF