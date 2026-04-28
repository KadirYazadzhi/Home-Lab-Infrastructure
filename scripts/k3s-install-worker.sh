#!/bin/bash

# K3s Worker Installation Script
# This script adds a node as a worker to an existing K3s cluster.

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <Control-Plane-IP> <Node-Token>"
    exit 1
fi

K3S_URL="https://$1:6443"
K3S_TOKEN="$2"

echo "Installing K3s worker and joining cluster at $K3S_URL..."
curl -sfL https://get.k3s.io | K3S_URL=$K3S_URL K3S_TOKEN=$K3S_TOKEN sh -

echo "Worker installation complete."
