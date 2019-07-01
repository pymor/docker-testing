FROM pymor/testing:3.7
MAINTAINER René Milk <rene.milk@wwu.de>

USER root
RUN apt-get update && \
    apt-get install libglvnd0  xvfb libgl1-mesa-dri libglu1-mesa  \
      # for pymor-dealII compile
      libgsl-dev \
      liblapack-dev \
      libnetcdf-c++4-dev \
      libnetcdf-cxx-legacy-dev \
      libnetcdf-dev && \
      #
    rm -rf /var/lib/apt/lists/* && \
    useradd --shell /bin/bash -u 1000 -o -c "" -m pymor
RUN pip install "pymor>=0.5.0,<0.6" && \
    pip install "pymor_dealii>=0.5.3,<0.6"
USER pymor

ENV LIBGL_DEBUG=verbose
ENTRYPOINT ["/usr/local/bin/pymor-demo"]
CMD ["--help"]
