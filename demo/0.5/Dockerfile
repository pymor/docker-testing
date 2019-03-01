FROM pymor/testing:3.6
MAINTAINER René Milk <rene.milk@wwu.de>

USER root
RUN echo 'APT::Default-Release "stable";' > /etc/apt/apt.conf.d/default-release && \
    echo "deb http://deb.debian.org/debian stretch-backports main contrib non-free" > /etc/apt/sources.list.d/stretch-backports.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y -t stretch-backports libglvnd0 && \
    apt-get install --no-install-recommends -y xvfb libgl1-mesa-dri libglu1-mesa && \
    rm -rf /var/lib/apt/lists/* && \
    useradd --shell /bin/bash -u 1000 -o -c "" -m pymor
RUN ${PIP_INSTALL} "pymor>=0.5.0,<0.6" && \
    ${PIP_INSTALL} "pymor_dealii>=0.5.0,<0.6"
USER pymor

ENV LIBGL_DEBUG=verbose
ENTRYPOINT ["/usr/local/bin/pymor-demo"]
CMD ["--help"]


