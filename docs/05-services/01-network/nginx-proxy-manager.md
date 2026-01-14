# Service: Nginx Proxy Manager (NPM)

### 🧐 What is it?
A reverse proxy management system with a clean web interface. It sits in front of your internal apps and routes traffic based on hostnames.

### 💡 Why is it useful?
- **SSL Management:** Automated Let's Encrypt certificates.
- **Subdomains:** Allows using `jellyfin.yourdomain.com` instead of `IP:8096`.
- **Access Control:** Adds an extra layer of password protection to apps.

### ⚖️ Pros & Cons
*   **Pros:** Zero coding required for Nginx config, easy SSL renewals.
*   **Cons:** Single point of failure if the proxy goes down.
