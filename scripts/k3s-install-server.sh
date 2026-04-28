#!/bin/bash

# K3s Server Installation Script
# This script installs the K3s control plane with Traefik and ServiceLB disabled.

echo "Installing K3s control plane..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable traefik --disable servicelb" sh -

echo "Installation complete."
echo "Node token:"
sudo cat /var/lib/rancher/k3s/server/node-token
echo "Kubeconfig is at /etc/rancher/k3s/k3s.yaml"
