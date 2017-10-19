CODENAMES = artful trusty xenial zesty
NAMESPACE ?= pymor

.PHONY: codenames $(CODENAMES) push

codenames: $(CODENAMES)

$(CODENAMES):
	docker build --build-args=CODENAME=$@ -t $(NAMESPACE)/packaging_ubuntu:$@ .

push:
	docker push $(NAMESPACE)/packaging_ubuntu

all: codenames
