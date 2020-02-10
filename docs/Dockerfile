FROM pymor/testing:3.7
MAINTAINER René Fritze <rene.fritze@wwu.de>

USER root
RUN apt-get update && \
    apt-get install --no-install-recommends -y pandoc rsync \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pymor/pymor /src/pymor && ls -la /src/pymor && \
  mkdir /docs && \
  cd /src/pymor ; ls -l && for tag in 0.5.2 2019.2.0 ; do \
    mkdir /docs/${tag}/ && \
    git checkout ${tag} && \
    git clean -xdf && \
    (pip install .[docs] || pip install .) && \
    python setup.py build_ext -i && \
    make -C docs html && \
    rsync -a docs/_build/html/ /docs/${tag}/ ; \
  done
