#!/bin/bash

set -euo pipefail

kubectl get virtualmachine ubuntu-jumpbox -o yaml | sed "s/powered.*/powered$1/g" | kubectl apply -f -