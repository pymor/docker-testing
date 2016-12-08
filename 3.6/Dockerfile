FROM pymor/python:3.6
MAINTAINER René Milk <rene.milk@wwu.de>

RUN /root/install_requirements.bash
RUN $FENICS_HOME/build_and_test.bash

# PySide has no wheel for 3.6 currently
#RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
#    python -c 'import  PySide' || echo "import PySide failed"
ENV LD_LIBRARY_PATH=/usr/local/lib/python3.6/site-packages/PySide/:${LD_LIBRARY_PATH}

USER pymor
VOLUME /src
WORKDIR /src
