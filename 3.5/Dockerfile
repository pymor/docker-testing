FROM pymor/python:3.5
MAINTAINER René Milk <rene.milk@wwu.de>

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash
RUN pip install pyqt5

# ngsolve is built with system python 3.5, hack dirs into local compiled python
RUN add-apt-repository -y ppa:mhochsteger/ngsolve && \
    apt-get update && \
    apt-get install -q --no-install-recommends -y ngsolve && \
    ln -s /usr/lib/python3/dist-packages/ngsolve /usr/local/lib/python3.5/site-packages/ngsolve && \
    ln -s /usr/lib/python3/dist-packages/netgen /usr/local/lib/python3.5/site-packages/netgen && \
    python -c "import ngsolve"
ENV DOCKER_NGSOLVE 1

VOLUME /src
WORKDIR /src
ENV PYTHONPATH /src/src
