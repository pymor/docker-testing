FROM pymor/base:3.7-rc
MAINTAINER René Milk <rene.milk@wwu.de>

RUN pip install pyqt5

VOLUME /src
WORKDIR /src
# cannot go into base image
ENV PYTHONPATH /src/src
