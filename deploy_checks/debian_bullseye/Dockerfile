FROM debian:testing

RUN apt update -y && apt install -y python3-pip && \
    apt remove -y gcc && apt autoremove -y
COPY pip /usr/local/bin/pip

COPY pip.conf /root/.pip/pip.conf
