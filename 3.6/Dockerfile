FROM pymor/python:3.6

ENV FENICS_PPA "ppa:pymor/fenics-py3"
ENV FENICS_PACKAGES="python3-zmq python3-dolfin python3-pyside python3-mpi4py"

ENV DEBIAN_FRONTEND noninteractive

RUN add-apt-repository -y ${FENICS_PPA}
RUN aptitude update
RUN aptitude install -y --without-recommends -q libslepc3.4.2-dev libhdf5-openmpi-dev  ${FENICS_PACKAGES}
RUN python -c 'import  dolfin' || echo "import dolfin failed"
RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside
RUN python -c 'import  PySide' || echo "import PySide failed"

ENV DEBIAN_FRONTEND teletype

VOLUME /src
WORKDIR /src


