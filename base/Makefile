PYTHONS = 2.7 3.4 3.5

.PHONY: pythons $(PYTHONS) xenial-base

pythons: $(PYTHONS)

xenial-base:
	docker build -t pymor/xenial-base xenial

$(PYTHONS): xenial-base
	docker build -t pymor/python:$@ $@

push: $(PYTHONS)
	docker push pymor/xenial-base
	docker push pymor/python

all: pythons
