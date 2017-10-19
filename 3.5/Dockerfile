FROM pymor/ngsolve:v6.2.1709 as ngsolve

FROM pymor/base:3.5
MAINTAINER René Milk <rene.milk@wwu.de>

RUN pip install pyqt5

COPY --from=ngsolve /root/ngsolve-*_amd64.deb /tmp
RUN apt update && apt install -y /tmp/ngsolve-*_amd64.deb && rm /tmp/ngsolve-*_amd64.deb && \
    ln -s /usr/lib/python3.5/site-packages/ngsolve \
          /usr/local/lib/python3.5/site-packages/ngsolve && \
    ln -s /usr/lib/python3.5/site-packages/netgen \
          /usr/local/lib/python3.5/site-packages/netgen

RUN python -c "import ngsolve"

ENV DOCKER_NGSOLVE 1
VOLUME /src
WORKDIR /src
ENV PYTHONPATH /src/src
