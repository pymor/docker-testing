DISTROS = ubuntu
NAMESPACE ?= pymor

.PHONY: distros $(DISTROS) push

distros: $(DISTROS)

$(DISTROS):
	$(MAKE) -C $@

push:
	$(MAKE) -C push
	docker push $(NAMESPACE)/testing

all: distros
