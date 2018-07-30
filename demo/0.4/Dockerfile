FROM pymor/testing:2.7
MAINTAINER René Milk <rene.milk@wwu.de>

USER root
RUN apt-get update && apt-get install \
    --no-install-recommends -y xauth x11-apps xvfb libgl1-mesa-dri-lts-xenial libgl1-mesa-dri libglu1-mesa
RUN ${PIP_INSTALL} --no-cache-dir pymor==0.4.1
USER pymor

RUN rm -rf ~/.matplotlib && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*


ENV LIBGL_DEBUG=verbose
# ENTRYPOINT ["/usr/local/bin/pymor-demo"]
# CMD ["--help"]
