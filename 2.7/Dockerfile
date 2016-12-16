FROM pymor/python:2.7
MAINTAINER René Milk <rene.milk@wwu.de>

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash

RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
    python -c 'import  PySide' || echo "import PySide failed"

USER pymor
VOLUME /src
WORKDIR /src
ENV PYTHONPATH /src/src
