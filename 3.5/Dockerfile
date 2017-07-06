FROM pymor/python:3.5
MAINTAINER René Milk <rene.milk@wwu.de>

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash
RUN pip install pyqt5

VOLUME /src
WORKDIR /src
ENV PYTHONPATH /src/src
