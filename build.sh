#!/usr/bin/env bash

set -x

# run build
docker build -t jobber:1.4.0 .

# copy binaries
docker run --name jobber-run jobber:1.4.0 /bin/true
docker cp jobber-run:/mnt/target/usr/local/libexec/jobberrunner dist/jobberrunner
docker rm jobber-run