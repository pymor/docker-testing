FROM pymor/python:3.5
MAINTAINER René Milk <rene.milk@wwu.de>

ARG NGSOLVE_VERSION=v6.2.1709

RUN apt-get update && \
    apt-get -y install libxmu-dev tk-dev tcl-dev cmake git g++ \
    libglu1-mesa-dev ccache openssh-client \
    python3 libpython3-dev python3-pytest python3-numpy python3-sphinx python3-pip \
    liboce-ocaf-dev libsuitesparse-dev python3-tk && \
    pip3 install sphinx_rtd_theme
ENV PATH="/opt/netgen/bin:${PATH}" \
    NGSOLVE_SRC_DIR=/root/src/ngsolve_src \
    NGSOLVE_BUILD_DIR=/root/src/ngsolve_build

# fake lsb-release to get ngsolve cmake to configure for deb package building
RUN echo "DISTRIB_CODENAME=stretch" > /etc/lsb-release && \
    git clone https://github.com/NGSolve/ngsolve.git ${NGSOLVE_SRC_DIR} && \
    cd ${NGSOLVE_SRC_DIR} && \
    git checkout ${NGSOLVE_VERSION} && \
    cd ${NGSOLVE_SRC_DIR}  && \
    git submodule update --init --recursive && \
    mkdir -p ${NGSOLVE_BUILD_DIR} && \
    cd ${NGSOLVE_BUILD_DIR} && \
    cmake ${NGSOLVE_SRC_DIR} \
    -DUSE_NATIVE_ARCH=OFF \
    -DUSE_OCC=ON \
    -DUSE_CCACHE=ON \
    -DUSE_MKL=OFF \
    -DUSE_UMFPACK=ON \
    -DINSTALL_PROFILES=OFF \
    -DENABLE_UNIT_TESTS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DNG_INSTALL_DIR_LIB=lib/netgen \
    -DNG_INSTALL_DIR_INCLUDE=include/netgen \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCPACK_PACKAGING_INSTALL_PREFIX=/usr \
    "-DCPACK_DEBIAN_PACKAGE_NAME=ngsolve${PACKAGE_NAME_SUFFIX}" && \
    make && \
    cd ${NGSOLVE_BUILD_DIR} && \
    make package && \
    mv ${NGSOLVE_BUILD_DIR}/ngsolve-*_amd64.deb /root/ && \
    rm -rf ${NGSOLVE_BUILD_DIR} ${NGSOLVE_SRC_DIR}

