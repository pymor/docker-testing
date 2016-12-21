Docker images to facilitate pymor testing
=========================================

Organization
------------

- ```/base/xenial``` is the base layer for all python version variants
- ```/base/?.?``` are the layers for the respective python version. These are copied from
the official python docker, with only the base switched to xenial (for fenics), and build python into ```/usr/local```
- ```/?.?/``` contain what pymor and version specific setup is needed


Usage example
-------------

```
docker pull pymor/testing:3.4
docker run -e LOCAL_USER_ID=$(id -u) -it -v $PATH_TO_PYMOR_REPO:/src pymor/testing:3.4 bash
# or
docker run -e LOCAL_USER_ID=$(id -u) -v $PATH_TO_PYMOR_REPO:/src pymor/testing:3.4 /src/.travis.script.bash
```

```LOCAL_USER_ID``` defaults to 1000, so you can skip that if your local user is 1000 already.
