ARG PYVER

FROM pymor/fenics:py${PYVER} as fenicslayer
FROM pymor/pyqt5:py${PYVER} as pyqt5layer
FROM pymor/ngsolve:py${PYVER}_v6.2.1709 as ngsolve
FROM pymor/python:${PYVER}

MAINTAINER René Milk <rene.milk@wwu.de>

# needs repeating to be usable outside FROM
ARG PYVER

ENV DEBIAN_FRONTEND=noninteractive \
    APTINSTALL="apt-get install -q -y --no-install-recommends" \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    PETSC_DIR=/usr/local/petsc-32 \
    DOCKER_NGSOLVE=1 \
    DOCKER_PYMOR=1

RUN apt-get update && \
    echo "C.UTF-8 UTF-8" > /etc/locale.gen && \
    ${APTINSTALL} wget curl less software-properties-common \
        libboost-all-dev texlive-base xvfb gnupg libatlas-dev \
        gcc g++ make libc6-dev dirmngr eatmydata \
        gmsh sudo paraview-python swig cmake libeigen3-dev python-subprocess32 \
        aptitude bison flex libopenblas-dev liblapack-dev libpcre3-dev ninja-build \
        xauth \
        libgmp-dev libmpfr-dev libcln-dev vim libhdf5-mpi-dev openmpi-bin libopenmpi-dev gosu && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    ${APTINSTALL} --allow-unauthenticated git-lfs && \
    git lfs install && \
    apt-key adv -v --keyserver keyserver.ubuntu.com \
        --recv-keys "BC85FC8237C72835544C5DED4E56948686EDFBEF" && \
    echo "deb http://ppa.launchpad.net/pymor/stable/ubuntu zesty main" \
        > /etc/apt/sources.list.d/pymor.list && \
    echo "alias ls='ls -h --color=auto'" >> /etc/bash.bashrc && \
    echo "alias ll='ls -lh'" >> /etc/bash.bashrc && \
    apt-get update && \
    aptitude install -q --without-recommends -y '?reverse-depends(python-pymor-demos)' && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=teletype \
    SLEPC_DIR=/usr/local/slepc-32 \
    PETSC_DIR=/usr/local/petsc-32

COPY --from=pyqt5layer /usr/local/ /usr/local/
COPY --from=fenicslayer /usr/local/ /usr/local/
COPY --from=ngsolve /root/ngsolve*deb /root

RUN ln -s /usr/lib/python${PYVER}/site-packages/ngsolve \
          /usr/local/lib/python${PYVER}/site-packages/ngsolve && \
    ln -s /usr/lib/python${PYVER}/site-packages/netgen \
          /usr/local/lib/python${PYVER}/site-packages/netgen && \
    apt update && apt install -y /root/ngsolve-*_amd64.deb && \
    rm /root/ngsolve-*.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python -c "import ngsolve"

ONBUILD RUN git clone https://github.com/pymor/pymor /tmp/pymor && \
    ${PIP_INSTALL} -U pip pytest-pycharm && \
    ${PIP_INSTALL} -r /tmp/pymor/requirements.txt && \
    ${PIP_INSTALL} -r /tmp/pymor/requirements-travis.txt && \
    ${PIP_INSTALL} -r /tmp/pymor/requirements-optional.txt && \
    /bin/bash -l -c "(find /usr \( -name '*.a*' -o -name '*.so*' \) -type f | grep -v freetype | grep -v _imaging | grep -v libtiff | xargs strip -p --strip-unneeded -d &> /dev/null ; du -sch .) || true " && \
    cd /tmp/pymor/ && \
    python setup.py build_ext -i && \
    cd src && \
    python -c "import pymor.core.config as cfg;import sys; sys.exit(not cfg.config.HAVE_FENICS)" && \
    python -c "from pymor.bindings.ngsolve import NGSolveVectorSpace" && \
    python -c "import ngsolve" && \
    python -c "import dolfin" && \
    python -c "import Qt" && \
    python -c "from PIL import Image, ImageDraw, ImageFont, _imagingft" && \
    python -c "import petsc4py" && \
    rm -rf /tmp/pymor

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["./.travis.script.bash"]
