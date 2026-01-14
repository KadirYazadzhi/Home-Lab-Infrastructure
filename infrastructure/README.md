# ⚙️ Infrastructure as Code (IaC)

This directory contains the *actual code* that runs the infrastructure.

## Structure
*   **[docker-compose/](docker-compose/):** Production-ready stacks.
    *   `01-network/`: OpenVPN, PiHole.
    *   `02-management/`: Portainer, Monitoring.
    *   `06-media/`: Jellyfin (Node C specific).
*   **[k8s/](k8s/):** Kubernetes manifests (if migrating from Docker Compose).
*   **[network/](network/):** Raw Firewall rules and Router configs.
