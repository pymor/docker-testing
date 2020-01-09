#!/bin/bash

devpi-server --restrict-modify root --start --host 127.0.0.1 --port 3141 --init
devpi-server --status
devpi use http://localhost:3141
devpi login root --password=''
devpi user -m root password="${DEVPI_PASSWORD}"
devpi index -y -c public bases=root/pypi pypi_whitelist='*'
devpi-server --stop
devpi-server --status

exec devpi-server --restrict-modify root --host 0.0.0.0 --port 3141
