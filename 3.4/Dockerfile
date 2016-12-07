FROM pymor/python:3.4

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash

RUN python -c 'import  dolfin' || echo "import dolfin failed" && \
    pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
    python -c 'import  PySide' || echo "import PySide failed"

ENV LD_LIBRARY_PATH=/usr/local/lib/python3.4/site-packages/PySide/:${LD_LIBRARY_PATH}
VOLUME /src
WORKDIR /src
