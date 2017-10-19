PYTHONS = 2.7 3.5 3.6
BASE := $(foreach t,$(PYTHONS),$(addsuffix $t,base))
NAMESPACE ?= pymor

.PHONY: pythons $(PYTHONS) base push 3.7-rc

pythons: $(PYTHONS)

base:
	$(MAKE) -C base

%_base :
	$(MAKE) -C base $(subst _base,,$@)

3.7-rc:
	$(MAKE) $@_base
	docker build -t pymor/testing:$@ $@

$(PYTHONS):
	$(MAKE) $@_base
	docker build -t pymor/testing:$@ $@

push:
	$(MAKE) -C base push
	docker push pymor/testing

demo: 2.7 3.5
	$(MAKE) -C demo

packaging:
	$(MAKE) -C packaging

all: pythons
