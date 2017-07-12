FROM pymor/python:3.4
MAINTAINER René Milk <rene.milk@wwu.de>

RUN pip install --no-index -f https://pymor.github.io/wheels/ PySide && \
    python -c 'import  PySide' || echo "import PySide failed"
RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash

VOLUME /src
WORKDIR /src
ENV PYTHONPATH /src/src
