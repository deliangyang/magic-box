#!/usr/bin/env bash

apt-get install software-properties-common
add-apt-repository ppa:ondrej/php

apt-get update
apt-get install php7.2 -y
apt-get install php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml -y

php -v