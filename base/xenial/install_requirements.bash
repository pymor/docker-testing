#/bin/bash

git clone https://github.com/pymor/pymor /tmp/pymor && \
    pip install -U pip && \
    pip install numpy==1.11 && \
    pip install -r /tmp/pymor/requirements.txt && \
    pip install -r /tmp/pymor/requirements-travis.txt && \
    pip install -r /tmp/pymor/requirements-optional.txt || echo "Some optional modules failed to install" && \
    rm -rf /tmp/pymor
