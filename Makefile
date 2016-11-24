PYTHONS = 2.7 3.4 3.5 3.6
BASE := $(foreach t,$(PYTHONS),$(addsuffix $t,base))

.PHONY: pythons $(PYTHONS) base push

pythons: $(PYTHONS)

base:
	$(MAKE) -C base

$(BASE) :
	$(MAKE) -C base $@

$(PYTHONS): base$@
	docker build -t pymor/testing:$@ $@

push: $(PYTHONS)
	$(MAKE) -C base push
	docker push pymor/testing

all: pythons
