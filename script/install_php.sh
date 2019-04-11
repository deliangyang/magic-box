#!/usr/bin/env bash

echo "deb https://mirror.xtom.com.hk/sury/php/ jessie main" > /etc/apt/sources.list.d/php.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B188E2B695BD4743

apt update

apt install php7.2 -y
apt install php7.2-fpm php7.2-dev php7.2-curl php7.2-dev php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml -y

php -v

cd /mnt
wget http://ftp.cn.debian.org/debian/pool/main/libt/libtool/libtool_2.4.2-1.11_all.deb
dpkg -i libtool_2.4.2-1.11_all.deb
apt install librabbitmq-dev
pecl install ampq

pecl install swoole
pecl install protobuf
