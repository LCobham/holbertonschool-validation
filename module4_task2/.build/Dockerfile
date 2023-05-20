# Base image
FROM golang:1.15.8-buster

# Expose port 9999
EXPOSE 9999

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Update existing packages
# hadolint ignore=DL3009
RUN apt-get update

# Get make, curl & wget, used for installing Hugo
# hadolint ignore=DL3008
RUN apt-get install  --no-install-recommends -y curl zip make python3 python3-pip \
    && python3 -m pip install --no-cache-dir requests==2.10.0

# Install Go linter
# hadolint ignore=DL4006
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/bin

# Install node to use npm
# hadolint ignore=DL3008,DL4006
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y --no-install-recommends nodejs

# Install markdown linter
RUN npm install -g markdown-link-check@v3.8 markdownlint-cli@v0.34.0

# Install Hugo in /usr/local/bin
# hadolint ignore=DL4001
RUN wget --progress=dot:giga https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_Linux-64bit.tar.gz \
    && tar -xvf hugo_extended_0.109.0_Linux-64bit.tar.gz hugo \
    && mv hugo /usr/local/bin \
    && rm -f hugo_extended_0.109.0_Linux-64bit.tar.gz
