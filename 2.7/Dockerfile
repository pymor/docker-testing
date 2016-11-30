FROM pymor/python:2.7

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash

RUN python -c 'import  dolfin' || echo "import dolfin failed" && \
    pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
    python -c 'import  PySide' || echo "import PySide failed"

VOLUME /src
WORKDIR /src
