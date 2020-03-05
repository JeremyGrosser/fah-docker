#!/bin/sh
if [ ! -e cores ]; then
    mkdir cores
fi
docker run -d --name fah -v $PWD/cores:/work/cores -p 8080:8080 fah
