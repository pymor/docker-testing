FROM pymor/base:3.7
MAINTAINER René Milk <rene.milk@wwu.de>

VOLUME /src
WORKDIR /src
# cannot go into base image
ENV PYTHONPATH /src/src

RUN python -c "import ngsolve" && \
    python -c "import dolfin" && \
    python -c "import Qt" && \
    python -c "from PIL import Image, ImageDraw, ImageFont, _imagingft" && \
    python -c "import petsc4py"
