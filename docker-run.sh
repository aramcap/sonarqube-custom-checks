#!/bin/bash

VMMC=$(sysctl vm.max_map_count -n)
FFM=$(sysctl fs.file-max -n)

if [[ ${VMMC} -lt 262144 ]]
then
  sudo sysctl -w vm.max_map_count=262144
fi

if [[ ${FFM} -lt 65536 ]]
then
  sudo sysctl -w fs.file-max=65536
fi

podman-compose up -d

