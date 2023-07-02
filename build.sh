#!/usr/bin/env bash

echo "build"

PYTHON=python2 amazon-linux-extras install epel

yum -y install supervisor

#yum install php-mbstring php-xml -y

# Composer install
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
echo "export PATH=~/.config/composer/vendor/bin:$PATH" >> ~/.bash_profile
source ~/.bash_profile

# dependencies install
composer install