PYTHONS = 2.7 3.4 3.5 3.6

.PHONY: pythons $(PYTHONS)

pythons: $(PYTHONS)

xenial-base:
	docker build -t pymor/xenial-base xenial

$(PYTHONS): xenial-base
	docker build -t pymor/python:$@ $@

all: pythons
