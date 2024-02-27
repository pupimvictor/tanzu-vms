#!/bin/sh

set -euo pipefail

cloudinit="${1:-cloud-init/basic.yaml}"

if [ ! -f $cloudinit ]
then
    echo "files doesn't exist: $cloudinit"
    exit 1
fi

cat $cloudinit | yq base64 -i $cloudinit > kustomization/base/user-data

echo user-data encoded from $cloudinit
cat kustomization/base/user-data 
