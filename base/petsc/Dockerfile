FROM debian:stretch
MAINTAINER René Milk <rene.milk@wwu.de>

ENV DEBIAN_FRONTEND=noninteractive \
    APTINSTALL="apt-get install -q -y --no-install-recommends"

RUN apt-get update && ${APTINSTALL} wget git curl ca-certificates\
        xvfb gnupg2 gcc g++ make libc6-dev \
        swig cmake libeigen3-dev python-subprocess32 \
        bison flex libopenblas-dev liblapack-dev libpcre3-dev ninja-build \
        libgmp-dev libmpfr-dev libcln-dev vim libhdf5-mpich-dev mpich && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=teletype \
    PETSC_VERSION=3.7.4
ENV PETSC_SRC_DIR=/root/petsc-${PETSC_VERSION}

RUN mkdir ${PETSC_SRC_DIR} && cd ${PETSC_SRC_DIR} && \
    set -e && wget --quiet -nc http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-${PETSC_VERSION}.tar.gz && \
    tar -xf petsc-lite-${PETSC_VERSION}.tar.gz --strip 1 && \
    python2 ./configure --COPTFLAGS="-O2" \
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
                --prefix=/usr/local/petsc-32 && \
     make && \
     rm -rf /tmp/*

RUN cd /root/petsc-${PETSC_VERSION} && \
    make install && ls -l /usr/local/petsc-32 && \
    rm -rf /root/petsc-${PETSC_VERSION}
