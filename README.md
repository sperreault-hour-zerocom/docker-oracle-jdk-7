# docker-oracle-java-7

Dockerfile creates a base image with Java8, GDAL and python installed in it. GDAL is used by EPSO for map upload.
Dockerfile.small creates a base image with Java8. It is used for all other images other than EPSO.

You will need to manually download jdk-8u202-linux-x64.tar.gz because it's too big for github.com.
