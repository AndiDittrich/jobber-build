Isolated build environment for jobberrunner
=============================================

see https://github.com/dshearer/jobber

Features
-----------------

* targeted to be used as scheduler within a container (docker/podman)
* build a standalone `joberrunner` binary

Usage
-----------------

Just run `build.sh` - the binary will be copied into the dist directory.

Dockerfile example
-------------------

```dockerfile
FROM debian:latest

# user downgrade
USER www-data

# new entrypoint
ENTRYPOINT [ "/usr/local/bin/jobberrunner" , "-s", "/etc/cron.yaml" ]
```


License
--------------------

jobber-build is OpenSource and licensed under the Terms of [The MIT License (X11)](http://opensource.org/licenses/MIT) - your're welcome to contribute