FROM pymor/python:2.7

ENV FENICS_PPA "ppa:fenics-packages/fenics"
ENV FENICS_PACKAGES "python-zmq python-dolfin python-pyside python-mpi4py"

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


