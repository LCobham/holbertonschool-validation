#!/bin/bash

## Update and Install make and wget
sudo apt-get update && sudo apt-get install -y make wget

## Download Hugo version 0.84 from GitHub
wget https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-64bit.tar.gz

## Decompress the executable into "hugo" binary
tar -xvf hugo_extended_0.109.0_Linux-64bit.tar.gz hugo

## Move "hugo" binary to a directory within the PATH and remove downloaded file
sudo mv hugo /usr/local/bin/
rm hugo_extended_0.109.0_Linux-64bit.tar.gz

## Install linter
sudo npm install -g markdown-link-check
sudo npm install -g markdownlint-cli
