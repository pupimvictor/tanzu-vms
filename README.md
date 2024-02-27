# Tanzu VMs

## Tanzu VM Service

[Tanzu VM Service]([https://](https://docs.vmware.com/en/VMware-vSphere/7.0/vmware-vsphere-with-tanzu/GUID-F81E3535-C275-4DDE-B35F-CE759EA3B4A0.html)) is a feature in vSphere with Tanzu that enables the creation and management of VMs in the same way an operator manages kubernetes pods

## Tanzu Jumpbox

This project contains the necessary resources to create and run an ubuntu VM with the Tanzu tools installed, creating a jumpbox for platform operators to use.

## How to Deploy

### Add a ssh public key to a cloudinit cfg file in ./cloud-init

under `users`, add your own ssh public key:

```yml
ssh-authorized-keys:
  - ssh-rsa dqmFhR1+Jyour key stuff here...
```

### Encode user-data

`./cp-cloud-init-to-cm.sh cloud-init/vmware-basic.yaml`

### apply templates

for the sbx env, for exemple:

`kubectl apply -k ./kustomization/sbx`

### get ip

`kubectl get virtualmachine ubuntu-vm  -o jsonpath='{.status.vmIp'`

### ssh

`ssh -i <your-key> vmware@<vmIp>`