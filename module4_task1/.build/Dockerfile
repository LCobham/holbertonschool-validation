# Build from golang and node image, both buster so they're compatible
FROM golang:latest

# Expose port 9999
EXPOSE 9999

# Update existing packages
RUN apt-get update

# Get make, curl & wget, used for installing Hugo
RUN apt-get install -y curl wget zip make

# Install Hugo in /usr/local/bin
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-64bit.tar.gz
RUN tar -xvf hugo_extended_0.109.0_Linux-64bit.tar.gz hugo
RUN mv hugo /usr/local/bin && rm -f hugo_extended_0.109.0_Linux-64bit.tar.gz

# Install pip for installing Requests (make validate)
RUN apt-get install -y python3 python3-pip
RUN python3 -m pip install requests

# Install Go linter
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/bin

# Install node to use npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install markdown linter
RUN npm install -g markdown-link-check
RUN npm install -g markdownlint-cli

