PYTHONS = 2.7 3.4 3.5 3.6
NAMESPACE ?= pymor

.PHONY: pythons $(PYTHONS) xenial-base

pythons: $(PYTHONS)

xenial-base:
	sed -e "s/DOCKER_NAMESPACE/$(NAMESPACE)/g" xenial/Dockerfile.in > xenial/Dockerfile
	docker build -t $(NAMESPACE)/xenial-base xenial

$(PYTHONS): xenial-base
	sed -e "s/DOCKER_NAMESPACE/$(NAMESPACE)/g" $@/Dockerfile.in > $@/Dockerfile
	docker build -t $(NAMESPACE)/python:$@ $@

push:
	docker push $(NAMESPACE)/xenial-base
	docker push $(NAMESPACE)/python

all: pythons
