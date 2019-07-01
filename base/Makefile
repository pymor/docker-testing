PYTHONS = 3.6 3.7

.PHONY: pythons $(PYTHONS)

pythons: $(PYTHONS)


$(PYTHONS):
	docker build --build-arg PYVER=$@ -t pymor/base:$@ buster

push:
	docker push pymor/base

all: pythons
