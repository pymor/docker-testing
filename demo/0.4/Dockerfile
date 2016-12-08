FROM pymor/testing:2.7
MAINTAINER René Milk <rene.milk@wwu.de>

USER root
RUN apt-get update && apt-get install \
    --no-install-recommends -y xauth x11-apps xvfb libgl1-mesa-dri-lts-xenial libgl1-mesa-dri libglu1-mesa
RUN pip install pymor==0.4.1
USER pymor

RUN rm -rf ~/.matplotlib

ENV LIBGL_DEBUG=verbose
# ENTRYPOINT ["/usr/local/bin/pymor-demo"]
# CMD ["--help"]
