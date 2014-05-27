#!/bin/bash

sudo apt-get install curl vim git tree htop terminator openjdk-7-jdk httpie multitail\
  libapache2-mod-php5 phpunit mysql-client mysql-server mysql-workbench\
  npm nodejs nodejs-legacy ruby 

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

sudo npm install -g grunt-cli
sudo npm install -g bower

sudo gem install compass

sudo a2enmod rewrite headers
sudo service apache2 restart
