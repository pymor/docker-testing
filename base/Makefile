PYTHONS = 2.7 3.4 3.5 3.6 3.7-rc

.PHONY: pythons $(PYTHONS) petsc ngsolve

pythons: $(PYTHONS)

ngsolve:
	docker build -t pymor/ngsolve:v6.2.1709 ngsolve
petsc:
	docker build -t pymor/petsc:3.7.4 petsc

3.5: petsc ngsolve
	docker build --build-arg PYVER=$@ -t pymor/base:$@ stretch

$(PYTHONS): petsc
	docker build --build-arg PYVER=$@ -t pymor/base:$@ stretch

push:
	echo docker push pymor/petsc
	echo docker push pymor/xenial-base
	echo docker push pymor/python

all: pythons
