# K3s Cluster Installation Guide

This guide describes the installation and configuration of a K3s cluster with 3 nodes (1 control plane and 2 workers).

## K3s Installation

### 1. Install Control Plane Server
SSH into the control plane server and execute:
```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable traefik --disable servicelb" sh -
```

### 2. Retrieve Token
Retrieve the node token, which is needed to join worker nodes:
```bash
cat /var/lib/rancher/k3s/server/node-token
```

### 3. Retrieve Kubeconfig
Retrieve the certificate to communicate with the cluster. Save this on your local machine in `~/.kube/<your-config-file>`.
```bash
cat /etc/rancher/k3s/k3s.yaml
```

### 4. Add Worker Node
SSH into each worker node and execute:
```bash
curl -sfL https://get.k3s.io | K3S_URL=https://<Control-Plane-IP>:6443 \
K3S_TOKEN=<YourToken> sh -
```

### 5. Verify Installation
Load the Kubernetes config on your local machine:
```bash
export KUBECONFIG=~/.kube/<your-config-file>
kubectl get nodes
```

## Load Balancing & Ingress

### MetalLB Installation
Add MetalLB to the cluster for a single access point:
1. Apply default manifests for version 0.11.
2. Configure using Layer 2 with a range of IP-addresses not in use.

### Traefik Installation
Install Traefik using Helm:
```bash
helm repo add traefik https://helm.traefik.io/traefik
```
Create `values.yaml`:
```yaml
dashboard:
  enabled: true
  domain: traefik.<Your-Domain-Name>
rbac:
  enabled: true
```
Install:
```bash
helm install traefik traefik/traefik -n traefik --create-namespace -f values.yaml
```

## Management & Security

### Rancher Installation
Install Rancher using Helm:
```bash
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm install rancher rancher-latest/rancher \
 --namespace cattle-system \
 --create-namespace \
 --set hostname=<Your-Domain-Name> \
 --set bootstrapPassword=<Your-Password>
```

### Cert-Manager
Install for automatic certificate renewal:
```bash
helm repo add jetstack https://charts.jetstack.io
helm install cert-manager jetstack/cert-manager \
 --namespace cert-manager \
 --create-namespace \
 --version v1.5.1
```
Apply a self-signed ClusterIssuer:
```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: selfsigned
spec:
  selfSigned: {}
```
