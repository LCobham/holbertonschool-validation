#!/bin/bash

apt-get update && apt-get install -y wget make
wget "https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.deb"
sudo dpkg -i hugo_extended_0.84.0_Linux-64bit.deb
rm -rf hugo_extended_0.84.0_Linux-64bit.deb
make build

