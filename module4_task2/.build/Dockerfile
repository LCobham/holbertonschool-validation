# Base image
FROM golang:1.15.8-alpine

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# Get make, curl & wget, used for installing Hugo
# hadolint ignore=DL3018
RUN apk add --no-cache curl zip build-base make python3 py3-pip hugo \
    && python3 -m pip install --no-cache-dir requests==2.10.0

# Install hadolint
RUN curl -sSfL -o /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.6.0/hadolint-Linux-x86_64 \
    && chmod +x /usr/local/bin/hadolint

# Install Go linter
# hadolint ignore=DL4006
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/bin

# Install node to use npm
# hadolint ignore=DL3018
RUN apk add --no-cache nodejs npm

# hadolint ignore=DL3059,DL4001
RUN npm install -g markdown-link-check@v3.8 markdownlint-cli@v0.34.0
