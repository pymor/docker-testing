ARG PYVER

FROM pymor/fenics:py${PYVER} as fenicslayer

FROM pymor/python:$PYVER
MAINTAINER René Milk <rene.milk@wwu.de>

ENV DEBIAN_FRONTEND=noninteractive \
    APTINSTALL="apt-get install -q -y --no-install-recommends" \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    PETSC_DIR=/usr/local/petsc-32

RUN apt-get update && \
    echo "C.UTF-8 UTF-8" > /etc/locale.gen && \
    ${APTINSTALL} wget curl less software-properties-common \
        libboost-all-dev texlive-base xvfb gnupg libatlas-dev \
        gcc g++ make libc6-dev dirmngr \
        gmsh sudo paraview-python swig cmake libeigen3-dev python-subprocess32 \
        aptitude bison flex libopenblas-dev liblapack-dev libpcre3-dev ninja-build \
        xauth \
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
ENV DEBIAN_FRONTEND=teletype

COPY --from=fenicslayer /usr/local/ /usr/local/

ONBUILD RUN git clone https://github.com/pymor/pymor /tmp/pymor && \
    pip install -U pip && \
    pip install -r /tmp/pymor/requirements.txt && \
    pip install -r /tmp/pymor/requirements-travis.txt && \
    pip install -r /tmp/pymor/requirements-optional.txt && \
    rm -rf /tmp/pymor

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["./.travis.script.bash"]
