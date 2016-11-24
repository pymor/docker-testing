FROM pymor/python:2.7

ENV FENICS_PPA "ppa:fenics-packages/fenics"
ENV FENICS_PACKAGES "python-zmq python-dolfin python-pyside python-mpi4py"

ENV DEBIAN_FRONTEND noninteractive
RUN add-apt-repository -y ${FENICS_PPA} && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends libhdf5-openmpi-dev  ${FENICS_PACKAGES}
ENV DEBIAN_FRONTEND teletype

RUN python -c 'import  dolfin' || echo "import dolfin failed" && \
    pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
    python -c 'import  PySide' || echo "import PySide failed"

RUN git clone https://github.com/pymor/pymor /tmp/pymor && \
    pip install -U pip && \
    pip install -U numpy && \
    pip install -r /tmp/pymor/requirements.txt && \
    pip install -r /tmp/pymor/requirements-travis.txt && \
    pip install -r /tmp/pymor/requirements-optional.txt || echo "Some optional modules failed to install" && \
    rm -rf /tmp/pymor

VOLUME /src
WORKDIR /src
