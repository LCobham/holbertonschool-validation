#!/bin/bash

## Update and Install make and wget
apt-get update && apt-get install -y make wget

## Download Hugo version 0.84 from GitHub
# wget https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-64bit.tar.gz

## Decompress the executable into "hugo" binary
# tar -xvf hugo_extended_0.109.0_Linux-64bit.tar.gz hugo

## Move "hugo" binary to a directory within the PATH and remove downloaded file
# sudo mv hugo /usr/local/bin/
# rm hugo_extended_0.109.0_Linux-64bit.tar.gz

## Install linter
#curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sudo sh -s -- -b /usr/bin

# Install nvm & node to then install linter
#
#
# sudo npm install -g markdown-link-check
# sudo npm install -g markdownlint-cli

# W3C validator dependencies
# sudo python3 -m pip install requests

wget -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
chmod +x /usr/local/bin/hadolint

wget https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64
chmod +x container-structure-test-linux-amd64
mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test
