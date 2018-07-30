FROM pymor/testing:3.5
MAINTAINER René Milk <rene.milk@wwu.de>

USER root
RUN apt-get update && apt-get install \
    --no-install-recommends -y xauth x11-apps xvfb libgl1-mesa-dri-lts-xenial libgl1-mesa-dri libglu1-mesa
#RUN ${PIP_INSTALL} pymor==0.5.0
USER pymor

    rm -rf /var/lib/apt/lists/*


ENV LIBGL_DEBUG=verbose
# ENTRYPOINT ["/usr/local/bin/pymor-demo"]
# CMD ["--help"]


