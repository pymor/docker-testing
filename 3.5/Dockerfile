FROM pymor/python:3.5

RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside
RUN python -c 'import  PySide' || echo "import PySide failed"

RUN pip install -U pip
RUN pip install -U numpy
RUN git clone https://github.com/pymor/pymor /tmp/pymor
RUN pip install -r /tmp/pymor/requirements.txt
RUN pip install -r /tmp/pymor/requirements-travis.txt
RUN pip install -r /tmp/pymor/requirements-optional.txt || echo "Some optional modules failed to install"
RUN rm -rf /tmp/pymor

VOLUME /src
WORKDIR /src


