FROM pymor/testing:3.7
MAINTAINER René Milk <rene.milk@wwu.de>

USER root
RUN apt-get update && \
    apt-get install --no-install-recommends -y xvfb libgl1-mesa-dri libglu1-mesa libglvnd0 \
      # for pymor-dealII compile
      libgsl-dev \
      liblapack-dev \
      libnetcdf-c++4-dev \
      libnetcdf-cxx-legacy-dev \
      libnetcdf-dev \
      #
    && rm -rf ~/.matplotlib \
    && apt-get autoremove -y  \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --shell /bin/bash -u 1000 -o -c "" -m pymor \
    && ${PIP_INSTALL} --pre "pymor>=2019.2,<2019.3" \
    && ${PIP_INSTALL} --pre "pymor_dealii>=2019.2,<2019.3"
USER pymor

ENV LIBGL_DEBUG=verbose
ENTRYPOINT ["/usr/local/bin/pymor-demo"]
CMD ["--help"]
