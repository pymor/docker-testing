#!/bin/bash

/bin/bash -c "apt-get update && apt-get install -y swig cmake libeigen3-dev && \
                pip install ply sympy && \
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
