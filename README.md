# docker-oracle-java-7

This repo contains a Dockerfile for building an ubuntu Docker container with
Oracle JDK 7u80 installed. We track the `jdk-7u80-linux-x64.tar.gz` tarball in
the git repo directly because it is no longer publically available; you must
create an Oracle account in order to access it, due to JDK 7 reaching
end-of-life. As a result, all public Docker images for Oracle's JDK 7 have been
taken down. Since we need an Oracle JDK 7 Docker image for other Spieker Point
projects (currently only for Hour Zero Online, to create a JBoss 4.2.2.GA
image), we've created our own image.
