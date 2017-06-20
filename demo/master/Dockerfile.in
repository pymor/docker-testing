FROM pymor/testing:3.5
MAINTAINER René Milk <rene.milk@wwu.de>

USER root
RUN apt-get update && apt-get install \
    --no-install-recommends -y xauth x11-apps xvfb nvidia-367 libgl1-mesa-dri-lts-xenial libgl1-mesa-dri libglu1-mesa
RUN pip install git+https://github.com/pymor/pymor.git@master
USER pymor

RUN rm -rf ~/.matplotlib && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/pymor-demo"]

CMD ["--help"]
