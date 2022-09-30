#!/bin/bash

set -euo pipefail

kubectl get virtualmachine ubuntu-jumpbox -o yaml | sed "s/powered.*/poweredOff/g" | kubectl apply -f -
sleep 10
k get virtualmachine ubuntu-jumpbox  -o jsonpath='{.status.vmIp}' -w
kubectl get virtualmachine ubuntu-jumpbox -o yaml | sed "s/powered.*/poweredOn/g" | kubectl apply -f -
kubectl get virtualmachine ubuntu-jumpbox  -o jsonpath='{.status.vmIp}' -w |