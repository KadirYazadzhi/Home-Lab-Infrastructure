# 🏠 Home Lab Infrastructure

> **Role:** DevOps Educational Archive & Infrastructure-as-Code Repository  
> **Status:** Active / Production  
> **Access:** Zero Trust (VPN Only)

## 📖 Overview

This repository represents the complete **Infrastructure as Code (IaC)** for a secure, private home lab cluster. Unlike simple configuration backups, this project implements a full DevOps lifecycle including:

*   **Automated Provisioning:** Ansible playbooks to bootstrap bare-metal nodes.
*   **Service Orchestration:** Production-ready Docker Compose stacks.
*   **Disaster Recovery:** Automated backup scripts for critical data.
*   **Documentation:** A comprehensive Wiki-style knowledge base.

## 🏗 Hardware Inventory (The Cluster)

The infrastructure runs on a heterogeneous cluster of 4 physical HP nodes. While the CPU architecture is unified, roles are assigned based on storage and memory constraints.

| Node | Model | Specs | Primary Role |
| :--- | :--- | :--- | :--- |
| **Node A** | HP ProDesk G2 | i5-6500 / 8GB RAM | **Gateway & Network** (VPN/DNS) |
| **Node B** | HP ProDesk G2 | i5-6500 / 16GB RAM | **AI & VDI Host** (Ollama/Kasm) |
| **Node C** | **HP EliteDesk G3** | i5-6500 / 16GB RAM | **Storage Node** (1TB HDD Mount) |
| **Node D** | HP ProDesk G3 | i5-6500 / 8GB RAM | **Compute Worker** |

## 🛡 Network Architecture

The network enforces a **"Security by Obscurity"** philosophy.
*   **0 Open Ports:** No services (Nextcloud, Gitea, etc.) are exposed to the public internet.
*   **Single Entry Point:** UDP 1194 (OpenVPN).
*   **Internal Routing:** Nginx Proxy Manager routes internal domains (e.g., `git.home.lan`) behind the VPN.

👉 [View Network Topology Diagram](docs/01-architecture/topology.mermaid)

## 📂 Repository Map

```text
.
├── docs/                     # 📚 The Knowledge Base
│   ├── 01-architecture/      # Network diagrams & topology
│   └── 05-services/          # Detailed guides (Wiki) for every tool
│
├── infrastructure/           # ⚙️ Infrastructure as Code
│   └── docker-compose/       # Production Stacks (The "Live" Configs)
│       ├── 01-network/       # VPN, PiHole, NPM
│       ├── 02-management/    # Portainer, Uptime Kuma
│       ├── 03-development/   # Gitea, Judge0
│       ├── 06-media/         # Jellyfin, Autobrr (Node C)
│       └── ...
│
├── inventory/                # 🛠 Provisioning
│   └── ansible/              # Playbooks to setup Docker & Mounts
│
└── scripts/                  # 🚑 Utilities
    └── backup.sh             # Disaster Recovery script
```

## 🧩 Service Catalog

Each service is fully documented with deployment guides, pros/cons, and configuration details.

### 1. Network & Security
*   [OpenVPN](docs/05-services/01-network/openvpn.md): The secure gateway.
*   [Pi-Hole](docs/05-services/01-network/pihole.md): DNS sinkhole & ad-blocking.
*   [Nginx Proxy Manager](docs/05-services/01-network/nginx-proxy-manager.md): SSL & Routing.

### 2. Development & Lab
*   [Gitea](docs/05-services/03-development/gitea.md): Self-hosted Git server.
*   [Judge0](docs/05-services/03-development/judge0.md): Remote Code Execution engine.
*   [CPP-IDE](docs/05-services/03-development/cpp-ide.md): Web-based C++ environment.

### 3. Productivity & AI
*   [Nextcloud](docs/05-services/05-productivity/nextcloud.md): Private cloud storage.
*   [Ollama & Open-WebUI](docs/05-services/04-ai-lab/open-webui.md): Local LLM inference (ChatGPT alternative).
*   [Kasm Workspaces](docs/05-services/08-vdi/kasm.md): Browser-based VDI & Isolation.

### 4. Media (Node C)
*   [Jellyfin](docs/05-services/06-media/jellyfin.md): Media streaming server.
*   [Autobrr](docs/05-services/06-media/autobrr.md): Automated release monitoring.

## 🚀 Getting Started

### 1. Provisioning Nodes (Ansible)
Prepare the bare-metal nodes (install Docker, mount drives).
```bash
cd inventory/ansible
ansible-playbook -i hosts.ini site.yml
```

### 2. Deploying a Stack
Example: Deploying the Network Stack (VPN + DNS).
```bash
cd infrastructure/docker-compose/01-network
cp .env.example .env
# Edit .env with your passwords
docker-compose up -d
```

### 3. Disaster Recovery
Run the backup script to archive critical configurations to the Storage Node.
```bash
./scripts/backup.sh
```