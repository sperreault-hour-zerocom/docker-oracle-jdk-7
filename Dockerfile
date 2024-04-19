# Ubuntu with Oracle JDK version 1.7.0_80
# This image exists because Oracle's Java 7 is end-of-life; in order to obtain
# the tar.gz file you must create an Oracle account. Because of this, all other
# public Oracle JDK 7 Docker images seem to have been taken down.
FROM ubuntu:14.04 as build

ARG JAVA_INSTALL_PATH="/usr/local/java"
ARG JDK_SOURCE="jdk-8u202-linux-x64.tar.gz"
ARG CUSTOM_GDAL_URL="https://hz-general-storage.s3.ca-central-1.amazonaws.com/gdal-1.5.4-customized2.tar.gz"
ARG CUSTOM_GDAL_TARGZ_DIR="/srv/local"
ARG CUSTOM_GDAL_TARGZ_PATH="$CUSTOM_GDAL_TARGZ_DIR/gdal-1.5.4.2.tar.gz"

ENV JAVA_HOME="$JAVA_INSTALL_PATH/jdk1.8.0_202"

USER root

RUN mkdir -p "$JAVA_INSTALL_PATH"
COPY "./$JDK_SOURCE" "$JAVA_INSTALL_PATH"

# Extract the JDK into $JAVA_INSTALL_PATH and then GDAL setup

RUN tar xf "$JAVA_INSTALL_PATH/$JDK_SOURCE" -C "$JAVA_INSTALL_PATH" && \
rm "$JAVA_INSTALL_PATH/$JDK_SOURCE" && \
useradd --create-home --shell /bin/bash jboss && \
apt-get update && \
apt-get install -y python-gdal gdal-bin wget && \
mkdir -p "$CUSTOM_GDAL_TARGZ_DIR" && \
wget -qO "$CUSTOM_GDAL_TARGZ_PATH" "$CUSTOM_GDAL_URL" && \
cd "$CUSTOM_GDAL_TARGZ_DIR" && \
tar xzf "$CUSTOM_GDAL_TARGZ_PATH" && \
rm "$CUSTOM_GDAL_TARGZ_PATH" && \
chown -R jboss:jboss "$CUSTOM_GDAL_TARGZ_DIR"

FROM scratch

COPY --from=build / /