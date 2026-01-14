# Service: Portainer

### 🧐 What is it?
A powerful GUI for Docker management. It simplifies container orchestration, image pulls, and volume management.

### 💡 Why is it useful?
Allows you to manage the entire 4-node cluster's Docker instances from a single web page. Essential for checking logs or restarting hung containers quickly.

### ⚖️ Pros & Cons
*   **Pros:** Interactive console access, great visual representation of container health.
*   **Cons:** If exposed, it's a massive security vulnerability.

### 🛠️ Deployment Summary
- **Image:** `portainer/portainer-ce:latest`
- **Port:** `9443/tcp` (HTTPS), `9000/tcp` (HTTP)
