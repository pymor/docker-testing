PYTHONS = 3.6 3.7 3.8
BASE := $(foreach t,$(PYTHONS),$(addsuffix $t,base))
NAMESPACE ?= pymor

.PHONY: pythons $(PYTHONS) base push deploy_checks docs

pythons: $(PYTHONS)

base:
	$(MAKE) -C base

%_base :
	$(MAKE) -C base $(subst _base,,$@)

$(PYTHONS):
	$(MAKE) $@_base
	docker build -t pymor/testing:$@ $@
	docker-squash -h &> /dev/null && docker-squash pymor/testing:$@

push:
	$(MAKE) -C base push
	docker push pymor/testing
	docker push pymor/demo || echo pushing demo failed

demo: 3.7
	$(MAKE) -C demo

docs: 3.7
	docker build -t pymor/docs_base:1 docs

packaging:
	$(MAKE) -C packaging

deploy_checks:
	$(MAKE) -C deploy_checks

all: pythons
