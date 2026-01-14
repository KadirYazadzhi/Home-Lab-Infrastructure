# Source Control: Gitea

## 🛠️ Overview
Gitea is a painless self-hosted Git service. It provides the version control backbone for this entire Home Lab infrastructure. It is preferred over GitLab for this environment due to its extremely low resource footprint, which is ideal for the i5-6500 nodes.

## 📦 Container Inventory

| Container Name | Image | Port (Internal) | Port (Exposed) | Role |
| :--- | :--- | :--- | :--- | :--- |
| `gitea` | `gitea/gitea:latest` | 3000, 22 | 3033, 222 | Web UI & SSH Git server |
| `mysql-server-gitea` | `mysql:8` | 3306 | 3307 | Dedicated backend database |

## 🔧 Configuration & SSH
To avoid conflicts with the host machine's SSH (port 22), Gitea is configured to use port **222**.

*   **SSH Clone URL:** `ssh://git@<node-ip>:222/<user>/<repo>.git`
*   **Web Access:** `http://<node-ip>:3033` (Proxied via Nginx Proxy Manager to `git.home.lan`)

## 💾 Persistence
*   **Data:** Mounted to `/var/lib/gitea` to persist repositories, SSH keys, and user data.
*   **Database:** Persistent MySQL volumes ensure issues with the container do not result in data loss.
