FROM pymor/python:3.5

# PySide has no wheel for 3.5 currently
#RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
#    python -c 'import  PySide' || echo "import PySide failed"

RUN git clone https://github.com/pymor/pymor /tmp/pymor && \
    pip install -U pip && \
    pip install -U numpy && \
    pip install -r /tmp/pymor/requirements.txt && \
    pip install -r /tmp/pymor/requirements-travis.txt && \
    pip install -r /tmp/pymor/requirements-optional.txt || echo "Some optional modules failed to install" && \
    rm -rf /tmp/pymor

VOLUME /src
WORKDIR /src
