FROM pymor/python:3.6

RUN pip install -U pip
RUN pip install -U numpy
RUN git clone https://github.com/pymor/pymor
RUN pip install -r pymor/requirements.txt
RUN pip install -r pymor/requirements-travis.txt
RUN pip install -r pymor/requirements-optional.txt || echo "Some optional modules failed to install"

VOLUME /src
WORKDIR /src


