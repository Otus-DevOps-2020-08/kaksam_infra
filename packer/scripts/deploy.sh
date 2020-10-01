#!/bin/bash
sudo apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && sudo bundle install
