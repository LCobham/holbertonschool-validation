#!/bin/bash

## Update and Install make and wget
sudo apt-get update && sudo apt-get install -y make wget zip

## Download Hugo version 0.84 from GitHub
wget https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-64bit.tar.gz

## Decompress the executable into "hugo" binary
tar -xvf hugo_extended_0.109.0_Linux-64bit.tar.gz hugo

## Move "hugo" binary to a directory within the PATH and remove downloaded file
sudo mv hugo /usr/local/bin/
rm hugo_extended_0.109.0_Linux-64bit.tar.gz

## Install linter
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sudo sh -s -- -b /usr/bin 
sudo npm install -g markdown-link-check
sudo npm install -g markdownlint-cli

