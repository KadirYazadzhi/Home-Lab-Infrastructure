# Service: Kasm Workspaces

## 🧐 What is it?
Containerized Desktop Infrastructure.

## 🛠️ Installation & Deployment

**Warning:** Kasm is typically installed via an installer script, not just a simple docker-compose file, because it orchestrates other docker containers.

### Standard Installation
1.  **Download:**
    ```bash
    cd /tmp
    curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.15.0.06fdc8.tar.gz
    tar -xf kasm_release_*.tar.gz
    ```
2.  **Install:**
    ```bash
    sudo bash kasm_release/install.sh
    ```
    *   Accept the EULA.
    *   Wait for it to pull all images (`kasm_api`, `kasm_manager`, `kasm_proxy`...).

### 🔧 Configuration
*   **Default Port:** `443` (HTTPS)
*   **Default Login:** Shown at the end of the installation script. **Save these credentials!**

### ⚠️ Hardware Requirement
Kasm creates a swap partition by default. On Node B (16GB RAM), ensure you have enough disk space for swap.