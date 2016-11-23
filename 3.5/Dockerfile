FROM pymor/python:3.5

RUN pip install --no-index -f https://pymor.github.io/wheels/ pyside
RUN python -c 'import  PySide' || echo "import PySide failed"

RUN pip install -U pip
RUN pip install -U numpy
RUN git clone https://github.com/pymor/pymor
RUN pip install -r pymor/requirements.txt
RUN pip install -r pymor/requirements-travis.txt
RUN pip install -r pymor/requirements-optional.txt || echo "Some optional modules failed to install"

VOLUME /src
WORKDIR /src


