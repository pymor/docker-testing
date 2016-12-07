FROM pymor/python:3.5

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash

# PySide has no official wheel for 3.5 currently
RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
   python -c 'import  PySide' || echo "import PySide failed"

ENV LD_LIBRARY_PATH=/usr/local/lib/python3.5/site-packages/PySide/:${LD_LIBRARY_PATH}

VOLUME /src
WORKDIR /src
