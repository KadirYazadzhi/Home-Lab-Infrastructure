# Infrastructure Management & Monitoring

## 🎯 Purpose
This collection of services acts as the "Control Plane" for the home lab, providing dashboards for orchestration, reverse proxy management, and health monitoring.

## 📦 Container Inventory

| Container Name | Image | Role |
| :--- | :--- | :--- |
| `nginx-proxy-manager` | `jc21/nginx-proxy-manager` | **Reverse Proxy:** Manages SSL certs (Let's Encrypt) and routes traffic (e.g., `web.lan` -> `container:80`). |
| `portainer` | `portainer/portainer-ce` | **Orchestrator:** GUI for managing Docker containers, images, and networks. |
| `uptime-kuma` | `louislam/uptime-kuma` | **Monitoring:** Pings services every 60s and alerts via Telegram/Discord if a node goes down. |
| `big-bear-it-tools` | `corentinth/it-tools` | **Utilities:** Collection of dev tools (JSON formatter, Base64 converter, etc.). |
| `big-bear-myspeed` | `germannewsmaker/myspeed` | **Network Test:** Tracks upload/download bandwidth speed over time. |

## 🔗 Integration Logic
*   **Nginx Proxy Manager (NPM)** is the glue holding the internal network together. Instead of remembering `192.168.1.50:3000`, NPM routes `gitea.home` to that IP.
*   **Portainer** connects to the local Docker socket (`/var/run/docker.sock`) to control the lifecycle of all other containers listed in this repository.

## ⚠️ Critical Notes
*   **NPM Database:** Uses SQLite by default but should be backed up regularly to preserve SSL certificates and proxy host definitions.
*   **Security:** Ensure Portainer uses a strong password, as it has root-level access to the host system.
