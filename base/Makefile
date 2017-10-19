PYTHONS = 2.7 3.4 3.5 3.6 3.7-rc

.PHONY: pythons $(PYTHONS)

pythons: $(PYTHONS)


$(PYTHONS):
	docker build --build-arg PYVER=$@ -t pymor/base:$@ stretch

push:
	docker push pymor/base

all: pythons
