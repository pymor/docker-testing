FROM pymor/python:3.4

ENV FENICS_PPA "ppa:pymor/fenics-py3"
ENV FENICS_PACKAGES "python3-zmq python3-dolfin python3-pyside python3-mpi4py"

ENV DEBIAN_FRONTEND noninteractive
RUN add-apt-repository -y ${FENICS_PPA}
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends libslepc3.4.2-dev libhdf5-openmpi-dev  ${FENICS_PACKAGES}
ENV DEBIAN_FRONTEND teletype

RUN python -c 'import  dolfin' || echo "import dolfin failed"
RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside
RUN python -c 'import  PySide' || echo "import PySide failed"

RUN pip install -U pip
RUN pip install -U numpy
RUN git clone https://github.com/pymor/pymor /tmp/pymor
RUN pip install -r /tmp/pymor/requirements.txt
RUN pip install -r /tmp/pymor/requirements-travis.txt
RUN pip install -r /tmp/pymor/requirements-optional.txt || echo "Some optional modules failed to install"
RUN rm -rf /tmp/pymor

VOLUME /src
WORKDIR /src


