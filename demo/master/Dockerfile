FROM pymor/testing:3.7
MAINTAINER René Fritze <rene.fritze@wwu.de>

USER root
RUN apt-get update && apt-get install \
        --no-install-recommends -y xauth x11-apps xvfb libgl1-mesa-dri libglu1-mesa \
        libgsl-dev \
        liblapack-dev \
        libnetcdf-c++4-dev \
        libnetcdf-cxx-legacy-dev \
        libnetcdf-dev \
    && ${PIP_INSTALL} git+https://github.com/pymor/pymor.git@master#egg=pymor[full] \
    && ${PIP_INSTALL} -U git+https://github.com/pymor/pymor-deal.II#egg=pymor_dealii \
    && rm -rf ~/.matplotlib \
    && apt-get autoremove -y  \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --shell /bin/bash -u 1000 -o -c "" -m pymor

USER pymor
ENV LIBGL_DEBUG=verbose
# ENTRYPOINT ["/usr/local/bin/pymor-demo"]
# CMD ["--help"]

