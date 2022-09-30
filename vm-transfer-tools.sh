#! /bin/bash

set -euo pipefail

scp ./bin/* ubuntu-vm:/workspace

cat << EOF > install-script
cd /workspace

gunzip -d kubectl*
chmod ugo+x kubectl-linux-*
sudo install kubectl-linux-* /usr/local/bin/kubectl

mkdir ~/.kube
kubectl completion bash > ~/.kube/completion.bash.inc
printf "
# Kubectl shell completion
source '/home/vp/.kube/completion.bash.inc'
" >> /home/vp/.bash_profile
source /home/vp/.bash_profile

tar -xf tanzu-cli-bundle-*-linux-amd64.tar
cd cli
sudo install core/v1.3.1/tanzu-core-linux_amd64 /usr/local/bin/tanzu

tanzu version

tanzu plugin sync
tanzu plugin list
tanzu plugin install --local . all

tanzu init

tanzu completion bash >  /home/vp/.tanzu/completion.bash.inc
printf "\n# Tanzu shell completion\nsource '/home/vp/.tanzu/completion.bash.inc'\n" >> /home/vp/.bash_profile

cd ..
chmod ugo+x tmc
sudo install tmc /usr/local/bin/tmc
EOF

chmod +x install-script
scp install-script ubuntu-vm:/workspace
ssh ubuntu-vm '/workspace/install-script'
