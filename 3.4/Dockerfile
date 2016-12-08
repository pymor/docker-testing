FROM pymor/python:3.4
MAINTAINER René Milk <rene.milk@wwu.de>

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash

ENV LD_LIBRARY_PATH=/usr/local/lib/python3.4/site-packages/PySide/:${LD_LIBRARY_PATH}

USER pymor
VOLUME /src
WORKDIR /src
