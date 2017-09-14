#!/bin/bash
#Run this script with sudo
set -e

if [[ $(id -u) -ne 0 ]]; then
  echo "Please run script as root"
  exit 1
fi

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt update && sudo apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod
