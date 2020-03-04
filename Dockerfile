# golang 1.13 debian/buster
FROM golang:1.13.1-buster as buildsetup

# dependencies, structure
RUN set -xe \
    && apt-get update \
    && apt-get install -y \
        git rsync \
    && mkdir -p /build/src/github.com/dshearer/jobber \
    && mkdir -p /mnt/target \
    && cd /build/src/github.com/dshearer/jobber \
    && git clone https://github.com/AndiDittrich/jobber.git . \
    && git checkout v1.4.0

WORKDIR /build/src/github.com/dshearer/jobber

# Run build
FROM buildsetup as build

# run build
RUN set -xe \
    && cd /build/src/github.com/dshearer/jobber \
    && make check \
    && make install DESTDIR=/mnt/target
