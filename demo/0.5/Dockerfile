FROM pymor/testing:3.7
MAINTAINER René Fritze <rene.fritze@wwu.de>

USER root
RUN apt-get update && \
    apt-get install -y libglvnd0  xvfb libgl1-mesa-dri libglu1-mesa  && \
    rm -rf /var/lib/apt/lists/* && \
    useradd --shell /bin/bash -u 1000 -o -c "" -m pymor
RUN pip install "pymor>=0.5.0,<0.6"
USER pymor

ENV LIBGL_DEBUG=verbose
ENTRYPOINT ["/usr/local/bin/pymor-demo"]
CMD ["--help"]
