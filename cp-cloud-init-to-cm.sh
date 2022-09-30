#!/bin/sh

set -euo pipefail

cloudinit="${1:-cloud-init/basic.yaml}"

if [ ! -f $cloudinit ]
then
    echo "files doesn't exist: $cloudinit"
    exit 1
fi

cm_name=os-config-$(basename $cloudinit)

sed  "s/base64_userdata/$(base64 $cloudinit)/g" base-os-config.yaml > $cm_name

echo Config Map created: $cm_name
cat $cm_name
