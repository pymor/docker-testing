PYTHONS = 3.6 3.7
BASE := $(foreach t,$(PYTHONS),$(addsuffix $t,base))
NAMESPACE ?= pymor

.PHONY: pythons $(PYTHONS) base push deploy_checks

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
	docker push pymor/demo

demo: 3.7
	$(MAKE) -C demo

packaging:
	$(MAKE) -C packaging

deploy_checks:
	$(MAKE) -C deploy_checks

all: pythons
