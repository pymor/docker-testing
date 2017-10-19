ARG PYVER

FROM pymor/petsc:3.7.4 as petsclayer

ENV PETSC_DIR=/usr/local/petsc-32
RUN ls -la ${PETSC_DIR}

FROM pymor/python:$PYVER
MAINTAINER René Milk <rene.milk@wwu.de>

ENV DEBIAN_FRONTEND=noninteractive \
    APTINSTALL="apt-get install -q -y --no-install-recommends"

RUN apt-get update
RUN ${APTINSTALL} wget curl less software-properties-common \
        libboost-all-dev texlive-base xvfb gnupg libatlas-dev \
        gcc g++ make libc6-dev dirmngr \
        gmsh sudo paraview-python swig cmake libeigen3-dev python-subprocess32 \
        aptitude bison flex libopenblas-dev liblapack-dev libpcre3-dev ninja-build \
        libgmp-dev libmpfr-dev libcln-dev vim libhdf5-mpich-dev mpich gosu && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    ${APTINSTALL} --allow-unauthenticated git-lfs && \
    git lfs install && \
    apt-key adv -v --keyserver keyserver.ubuntu.com \
        --recv-keys "BC85FC8237C72835544C5DED4E56948686EDFBEF" && \
    echo "deb http://ppa.launchpad.net/pymor/stable/ubuntu zesty main" \
        > /etc/apt/sources.list.d/pymor.list && \
    apt-get update && \
    aptitude install -q --without-recommends -y '?reverse-depends(python-pymor-demos)' && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=teletype \
    FENICS_BUILD_TYPE=Release \
    FENICS_VERSION=2016.1.0 \
    FENICS_PREFIX=/usr/local \
    FENICS_HOME=/root/fenics \
    FENICS_SRC_DIR=/tmp/src \
    MPI4PY_VERSION=2.0.0 \
    PETSC4PY_VERSION=3.7.0 \
    OPENBLAS_NUM_THREADS=1 \
    OPENBLAS_VERBOSE=0 \
    PETSC_DIR=/usr/local/petsc-32

COPY --from=petsclayer ${PETSC_DIR} ${PETSC_DIR}

ADD install_requirements.bash /root/
ADD fenics/* /root/fenics/
# Install fenics as root user into /usr/local then remove the fenics-* scripts
# the fenics.env.conf file and the unnecessary /home/fenics/local directory as
# the user does not need them in the stable image!
ONBUILD RUN /root/install_requirements.bash && \
            $FENICS_HOME/build_and_test.bash
ONBUILD RUN rm -rf $FENICS_HOME
ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["./.travis.script.bash"]
