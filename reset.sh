#!/bin/bash

# Reset Kubernetes
kubeadm reset --force

# Remove Weave CNI config
WEAVE_CONFLIST="/etc/cni/net.d/10-weave.conflist"

if [ -f "$WEAVE_CONFLIST" ]; then
  echo "Removing Weave config: $WEAVE_CONFIG"
  rm /etc/cni/net.d/10-weave.conflist
else
  echo "No weave config to remove."
fi
