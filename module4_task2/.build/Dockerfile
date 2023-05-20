# hadolint global ignore=DL3008,DL3015,DL3059,DL3009,DL4006
FROM golang:1.15.8-buster

# Expose port 9999
EXPOSE 9999

# Update existing packages
RUN apt-get update

# Get make, curl & wget, used for installing Hugo
RUN apt-get install -y curl zip make

# Install Hugo in /usr/local/bin
RUN curl -o hugo_extended.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-64bit.tar.gz
RUN tar -xvf hugo_extended.tar.gz hugo
RUN mv hugo /usr/local/bin && rm -f hugo_extended_0.109.0_Linux-64bit.tar.gz

# Install pip for installing Requests (make validate)
RUN apt-get install -y python3=3.11.0 python3-pip=23.1.2
RUN python3 -m pip install --no-cache-dir requests==2.10.0

# Install Go linter
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | bash -o -s -- -b /usr/bin

# Install node to use npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -o -s
RUN apt-get install -y nodejs=14.21.3

# Install markdown linter
RUN npm install -g markdown-link-check@v3.8
RUN npm install -g markdownlint-cli@v0.34.0

