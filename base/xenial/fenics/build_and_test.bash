#!/bin/bash

wget --quiet -nc http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-${PETSC_VERSION}.tar.gz && \
    tar -xf petsc-lite-${PETSC_VERSION}.tar.gz && \
    cd petsc-${PETSC_VERSION} && \
    ./configure --COPTFLAGS="-O2" \
                --CXXOPTFLAGS="-O2" \
                --FOPTFLAGS="-O2" \
                --with-blas-lib=/usr/lib/libopenblas.a --with-lapack-lib=/usr/lib/liblapack.a \
                --with-c-support \
                --with-debugging=0 \
                --with-shared-libraries \
                --download-suitesparse \
                --download-scalapack \
                --download-metis \
                --download-parmetis \
                --download-ptscotch \
                --download-hypre \
                --download-mumps \
                --download-blacs \
                --download-spai \
                --download-ml \
                --prefix=/usr/local/petsc-32 && \
     make && \
     make install && \
     rm -rf /tmp/*


pip install --no-cache-dir ply sympy && \
    pip install --no-cache-dir matplotlib && \
    pip install --no-cache-dir https://bitbucket.org/mpi4py/mpi4py/downloads/mpi4py-${MPI4PY_VERSION}.tar.gz && \
    pip install --no-cache-dir https://bitbucket.org/petsc/petsc4py/downloads/petsc4py-${PETSC4PY_VERSION}.tar.gz && \
    pip install --no-cache-dir jupyter && \
    pip install --no-cache-dir ipython ipykernel && \
    rm -rf /tmp/*

/bin/bash -c "apt-get update && apt-get install -y swig cmake libpetsc3.6.2-dev \
               libeigen3-dev python-subprocess32  && \
               FENICS_SRC_DIR=/tmp/src $FENICS_HOME/fenics-build && \
               ldconfig && \
               rm -rf $FENICS_HOME/local && \
               rm -rf /tmp/src && \
               cp -r $FENICS_PREFIX/share/dolfin/demo $FENICS_HOME/demo && \
               rm -rf $FENICS_HOME/bin && \
               echo 'source /usr/local/share/dolfin/dolfin.conf' >> $FENICS_HOME/.profile"
# Make sure we get something that basically works on this stable build.  It
# would be better to run unit tests, but at the moment even the quick tests
# take too long to run.
# /bin/bash -l -c "mkdir -p /tmp/poisson_test && \
#     cd /tmp/poisson_test && \
#     python $FENICS_HOME/demo/documented/poisson/python/demo_poisson.py && \
#     instant-clean && \
#     rm -r /tmp/poisson_test"
