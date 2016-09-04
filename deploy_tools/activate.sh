#!/bin/bash

sed "s/SITENAME/superlists.quantamental.eu/g" deploy_tools/nginx.template.conf | sudo tee /etc/nginx/sites-available/superlists.quantamental.eu
sudo ln -s /etc/nginx/sites-available/superlists.quantamental.eu /etc/nginx/sites-enabled/superlists.quantamental.eu
sed "s/SITENAME/superlists.quantamental.eu/g" deploy_tools/gunicorn-init.d.template.conf | sudo tee /etc/init/gunicorn-superlists.quantamental.eu.conf
sudo service nginx reload
. /etc/init/gunicorn-superlists.quantamental.eu.conf start
