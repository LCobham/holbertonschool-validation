#!/bin/bash

## Install correct Hugo version 

sudo -E apt-get update && apt-get install -y wget make
sudo -E wget "https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.deb"
sudo -E dpkg -i hugo_extended_0.84.0_Linux-64bit.deb
rm -rf hugo_extended_0.84.0_Linux-64bit.deb

## instal markdown linter and check

sudo npm install -g markdown-link-check
sudo npm install -g markdownlint-cli

