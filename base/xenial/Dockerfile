FROM buildpack-deps:xenial

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb-src mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb-src mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb-src mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends software-properties-common aptitude build-essential \
    libboost1.58-all-dev mpi-default-bin texlive-base xvfb libatlas-dev
RUN add-apt-repository -y ppa:pymor/stable
RUN apt-get update
RUN aptitude install -q --without-recommends -y '?reverse-depends(python-pymor-demos)'
ENV DEBIAN_FRONTEND teletype

VOLUME /src
WORKDIR /src
