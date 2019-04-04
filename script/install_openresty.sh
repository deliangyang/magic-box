#!/usr/bin/env bash

wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -

sudo apt-get -y install software-properties-common

sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"

sudo apt-get update
sudo apt-get install openresty -y
sudo apt-get install --no-install-recommends openresty -y

nginx -t

NGX_CONF_PATH='/usr/local/openresty/nginx/conf'

mkdir -p /var/log/nginx
mkdir -p ${NGX_CONF_PATH}/conf.d
touch ${NGX_CONF_PATH}/conf.d/default.conf
nginx -t
