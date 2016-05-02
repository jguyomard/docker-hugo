FROM alpine:latest

MAINTAINER JG <julien@mangue.eu>

RUN apk add --no-cache \
    curl \
    openssh-client \
    rsync

ENV VERSION 0.15
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/spf13/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux_amd64.tar.gz | tar -xz \
    && mv hugo_*/hugo_* /usr/local/bin/hugo \
    && rm -rf hugo_*

WORKDIR /src

EXPOSE 1313
