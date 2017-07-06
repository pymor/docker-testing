PYTHONS = 2.7 3.4 3.5 3.6
BASE := $(foreach t,$(PYTHONS),$(addsuffix $t,base))
NAMESPACE ?= pymor

.PHONY: pythons $(PYTHONS) base push

pythons: $(PYTHONS)

base:
	$(MAKE) -C base

%_base :
	$(MAKE) -C base $(subst _base,,$@)

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
