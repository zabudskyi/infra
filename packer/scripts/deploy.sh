#!/bin/bash
sudo su appuser <<EOF
source ~/.rvm/scripts/rvm
cd ~/reddit && bundle install
EOF
