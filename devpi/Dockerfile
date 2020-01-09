FROM pymor/python:3.7

MAINTAINER René Fritze <rene.fritze@wwu.de>

ENV DEVPI_SERVER_VERSION=5.3.1 \
    DEVPI_CLIENT_VERSION=5.1.1 \
    DEVPI_PASSWORD=none \
    PIP_NO_CACHE_DIR="off" \
    PIP_INDEX_URL="https://pypi.python.org/simple" \
    PIP_TRUSTED_HOST="127.0.0.1" \
    DEVPISERVER_SERVERDIR="/data/server" \
    DEVPI_CLIENTDIR="/data/client"

RUN pip install "devpi-server==${DEVPI_SERVER_VERSION}" \
    "devpi-client==${DEVPI_CLIENT_VERSION}" \
  && useradd --shell /bin/bash -u 1000 -o -m -d /data -c "" -m pymor
EXPOSE 3141

COPY entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash

USER pymor
WORKDIR /data

ENTRYPOINT ["/entrypoint.bash"]
