DISTROS = centos_8 debian_stretch debian_buster debian_bullseye
NAMESPACE ?= pymor

.PHONY: distros $(DISTROS) push

distros: $(DISTROS)

$(DISTROS):
	cd $@ && docker build -t $(NAMESPACE)/deploy_checks:devpi_$@ .

push:
	docker push $(NAMESPACE)/deploy_checks

all: distros
