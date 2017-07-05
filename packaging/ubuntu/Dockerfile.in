FROM ubuntu:CODENAME
MAINTAINER René Milk <rene.milk@wwu.de>

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y ppa:pymor/stable && \
    apt-get update
