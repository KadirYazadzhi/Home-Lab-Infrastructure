# Service: Gitea

### 🧐 What is it?
A self-hosted Git service (like GitHub).

### 💡 Why is it useful?
This is where your "Infrastructure as Code" (IaC) lives. It stores all your Docker Compose files, Kubernetes manifests, and this documentation.

### ⚖️ Pros & Cons
*   **Pros:** Extremely low RAM usage (under 100MB), built-in Wiki and Issue tracking.
*   **Cons:** Not as many features as GitLab.

### 🛠️ Deployment Summary
- **Image:** `gitea/gitea:latest`
- **DB Image:** `mysql:8`
- **SSH Port:** `222`
