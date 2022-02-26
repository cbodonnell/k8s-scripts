#!/bin/sh

USER=$1

# Reset k8s
kubeadm reset --force

# Init k8s
kubeadm init

# Set KUBECONFIG
if [ -n "${USER}" ]; then
    HOME=$(eval echo ~${USER})
    mkdir -p ${HOME}/.kube
    echo "y" | cp -i /etc/kubernetes/admin.conf ${HOME}/.kube/config
    chown ${USER}:${USER} ${HOME}/.kube/config
    echo "KUBECONFIG set for $1"
else
    # export KUBECONFIG=/etc/kubernetes/admin.conf
    echo "KUBECONFIG not set. See instructions above to set..."
fi

# Apply Weave CNI
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# Untaint master node
kubectl taint nodes $(hostname) node-role.kubernetes.io/master-
