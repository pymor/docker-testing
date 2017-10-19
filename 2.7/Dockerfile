FROM pymor/base:2.7
MAINTAINER René Milk <rene.milk@wwu.de>

RUN apt update && apt install libpyside1.2 && \
    pip install --no-index -f https://pymor.github.io/wheels/ pyside && \
    python -c 'import  PySide' || echo "import PySide failed"

VOLUME /src
WORKDIR /src
ENV PYTHONPATH /src/src
