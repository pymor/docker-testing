FROM pymor/testing:3.7
MAINTAINER René Fritze <rene.fritze@wwu.de>

USER root
RUN apt-get update && \
    apt-get install --no-install-recommends -y xvfb libgl1-mesa-dri libglu1-mesa libglvnd0 \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --shell /bin/bash -u 1000 -o -c "" -m pymor \
    && ${PIP_INSTALL} --pre "pymor>=2019.2rc0,<2019.3" 
USER pymor

ENV LIBGL_DEBUG=verbose
ENTRYPOINT ["/usr/local/bin/pymor-demo"]
CMD ["--help"]
