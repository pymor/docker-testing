PYTHONS = 2.7 3.4 3.5 3.6
BASE := $(foreach t,$(PYTHONS),$(addsuffix $t,base))
NAMESPACE ?= pymor

.PHONY: pythons $(PYTHONS) base push

pythons: $(PYTHONS)

base:
	$(MAKE) -C base

$(BASE) :
	$(MAKE) -C base $@

$(PYTHONS): base$@
	sed -e "s/DOCKER_NAMESPACE/$(NAMESPACE)/g" $@/Dockerfile.in > $@/Dockerfile
	docker build -t $(NAMESPACE)/testing:$@ $@

push:
	$(MAKE) -C base push
	docker push $(NAMESPACE)/testing

demo: 2.7 3.5
	$(MAKE) -C demo

all: pythons
