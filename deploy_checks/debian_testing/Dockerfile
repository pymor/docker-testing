FROM debian:testing

RUN apt update -y && apt install -y python3-pip && \
    apt remove -y gcc && apt autoremove -y
