FROM pymor/ngsolve:py3.7_v6.2.1709 as ngsolve

FROM pymor/base:3.7
MAINTAINER René Milk <rene.milk@wwu.de>

ENV DOCKER_NGSOLVE 1
VOLUME /src
WORKDIR /src
# cannot go into base image
ENV PYTHONPATH /src/src
