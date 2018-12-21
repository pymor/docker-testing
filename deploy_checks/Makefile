DISTROS = centos_7 debian_stable  debian_testing
NAMESPACE ?= pymor

.PHONY: distros $(DISTROS) push

distros: $(DISTROS)

$(DISTROS):
	cd $@ && docker build -t $(NAMESPACE)/deploy_checks:$@ .

push:
	docker push $(NAMESPACE)/deploy_checks

all: distros
