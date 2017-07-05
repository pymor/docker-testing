CODENAMES = artful trusty xenial zesty
NAMESPACE ?= pymor

.PHONY: codenames $(CODENAMES) push

codenames: $(CODENAMES)

$(CODENAMES):
	sed -e "s/CODENAME/$@/g" Dockerfile.in > $@/Dockerfile
	docker build -t $(NAMESPACE)/packaging_ubuntu:$@ $@

push:
	docker push $(NAMESPACE)/packaging_ubuntu

all: codenames
