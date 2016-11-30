FROM pymor/python:3.6

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash

# PySide has no wheel for 3.6 currently
#RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
#    python -c 'import  PySide' || echo "import PySide failed"

VOLUME /src
WORKDIR /src
