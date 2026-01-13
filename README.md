# Home-Lab-Infrastructure

> **Role:** DevOps Educational Archive & Infrastructure-as-Code Repository  
> **Status:** Active / Maintenance Mode  
> **Access:** Private (VPN Only)

## 📖 About This Repository

This repository documents the journey of building a secure, private, and resilient home lab infrastructure. Unlike typical configuration dumps, this project serves as a "Knowledge Base," documenting the *why* behind architectural decisions alongside the *how*.

The core philosophy is **Security by Obscurity & Design**: No ports are exposed to the public internet. Access is strictly controlled via OpenVPN tunnels with internal DNS filtering.

## 🏗 Hardware Inventory (The Cluster)

The infrastructure runs on a heterogeneous cluster of 4 physical nodes, unified by CPU architecture but differentiated by storage and memory capabilities.

| Node | Model | CPU (All Nodes) | RAM | Storage | Role |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Node A** | HP ProDesk G2 | Intel Core i5-6500 | 8GB | 256GB SSD | Compute Worker |
| **Node B** | HP ProDesk G2 | Intel Core i5-6500 | 16GB | 256GB SSD | Compute / Memory Optimized |
| **Node C** | **HP EliteDesk G3** | Intel Core i5-6500 | **16GB** | **256GB NVMe + 1TB HDD** | **Storage & Media (Jellyfin)** |
| **Node D** | HP ProDesk G3 | Intel Core i5-6500 | 8GB | 256GB SSD | Compute Worker |

*Note: Node C is pinned via Kubernetes Node Affinity to handle stateful heavy workloads due to its expanded storage capacity.*

## 🛡 Network & Security Architecture

*   **Ingress:** 0 Open Ports (80/443 closed).
*   **VPN:** OpenVPN is the sole entry point.
*   **DNS:** Custom Internal DNS via Pi-Hole (accessible only over VPN).
*   **Privacy:** Optional routing through Tor for specific service flows.

## 📂 Repository Structure

- `docs/` - **Knowledge Base**: Detailed tutorials and architectural decisions.
- `infrastructure/` - **IaC**: Kubernetes manifests and Docker Compose files.
- `inventory/` - **Provisioning**: Hardware mapping and Ansible inventories.

## 📚 Featured Documentation

1. [Zero-Trust at Home: OpenVPN & Pi-Hole Integration](docs/03-network/README.md)
2. [Handling Heterogeneous Storage in K8s](docs/02-hardware/node-roles.md)
3. [Resource Constraints: K8s vs Docker Compose](docs/04-tutorials/docker-vs-k8s.md)
