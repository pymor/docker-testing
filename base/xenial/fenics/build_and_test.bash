#!/bin/bash

set -e
set -x

pip install --no-cache-dir ply sympy==1.0 && \
    pip install --no-cache-dir matplotlib && \
    pip install --no-cache-dir https://bitbucket.org/mpi4py/mpi4py/downloads/mpi4py-${MPI4PY_VERSION}.tar.gz && \
    pip install --no-cache-dir https://bitbucket.org/petsc/petsc4py/downloads/petsc4py-${PETSC4PY_VERSION}.tar.gz && \
    pip install --no-cache-dir jupyter==1.0.0 && \
    pip install --no-cache-dir ipython==5.1.0 ipykernel==4.5.2

FENICS_SRC_DIR=/tmp/src $FENICS_HOME/fenics-build && \
    ldconfig && \
    rm -rf $FENICS_HOME/local && \
    rm -rf /tmp/src && \
    cp -r $FENICS_PREFIX/share/dolfin/demo $FENICS_HOME/demo && \
    rm -rf $FENICS_HOME/bin && \
    echo 'source /usr/local/share/dolfin/dolfin.conf' >> $FENICS_HOME/.profile

# Make sure we get something that basically works on this stable build.  It
# would be better to run unit tests, but at the moment even the quick tests
# take too long to run.
# /bin/bash -l -c "mkdir -p /tmp/poisson_test && \
#     cd /tmp/poisson_test && \
#     python $FENICS_HOME/demo/documented/poisson/python/demo_poisson.py && \
#     instant-clean && \
#     rm -r /tmp/poisson_test
