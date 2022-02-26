# Kubernetes Cluster Scripts
This repository provides some basic utility scripts for single-node Kubernetes clusters.

## Commands
To intialize a basic single-node cluster, run:
`cat init.sh | sudo bash -s $(whoami)`

To teardown the cluster created using the above command, run the following:
`cat reset.sh | sudo bash`