# Tanzu VMs

## Tanzu VM Service

[Tanzu VM Service]([https://](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-F81E3535-C275-4DDE-B35F-CE759EA3B4A0.html)) is a feature in vSphere with Tanzu that enables the creation and management of VMs in the same way an operator manages kubernetes pods

## Tanzu Jumpbox

This project contains the necessary resources to create and run an ubuntu VM with the Tanzu tools installed, creating a jumpbox for platform operators to use.

## How to Deploy

### set up ssh key

`todo`

### set up cli binaries

`todo`

### apply templates

`kubectl apply -k ./kustomization`

### get ip

`kubectl get virtualmachine ubuntu-vm  -o jsonpath='{.status.vmIp}'`

### ssh

`todo`