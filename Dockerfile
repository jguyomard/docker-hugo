FROM debian:9.4-slim

MAINTAINER JG <julien@mangue.eu>

RUN apt-get update && apt-get install -y \
    curl \
    git \
    openssh-client \
    rsync \
    && rm -rf /var/lib/apt/lists/*

ARG RELEASE_VERSION=0.55.0
ARG PACKAGE_VERSION=0.55.0
ENV RELEASE_VERSION=$RELEASE_VERSION
ENV PACKAGE_VERSION=$PACKAGE_VERSION

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${RELEASE_VERSION}/hugo_${PACKAGE_VERSION}_linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
    && mv minify /usr/local/bin/

WORKDIR /src

EXPOSE 1313
