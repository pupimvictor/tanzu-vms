#! /bin/bash

set -euo pipefail

./cp-cloud-init-to-cm.sh
echo ""
# kubectl apply -f os-config-tanzu-tools.yaml

if kubectl get -f vm-ubuntu.yaml -n vms
then
    kubectl delete -f vm-ubuntu.yaml -n vms
    kubectl delete -f vm-pvc.yaml -n vms
fi
kubectl apply -f vm-pvc.yaml -n vms
kubectl apply -f vm-ubuntu.yaml -n vms
kubectl apply -f vm-lb.yaml -n vms

kubectl get virtualmachine ubuntu-jumpbox  -o jsonpath='{.status.vmIp}' -w