#/bin/bash

git clone https://github.com/pymor/pymor /tmp/pymor && \
    pip install -U pip && \
    pip install numpy==1.11 && \
    pip install -r /tmp/pymor/requirements.txt && \
    pip install -r /tmp/pymor/requirements-travis.txt && \
    pip install -r /tmp/pymor/requirements-optional.txt && \
    rm -rf /tmp/pymor
