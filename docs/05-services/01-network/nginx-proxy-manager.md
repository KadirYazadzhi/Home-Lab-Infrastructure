# Service: Nginx Proxy Manager (NPM)

## 🧐 What is it?
Nginx Proxy Manager provides a web UI to manage Nginx. It handles SSL offloading (HTTPS) and routing. Instead of remembering `192.168.1.50:3000` for Gitea, you can map `git.home.lan` to it.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'   # Public HTTP
      - '81:81'   # Admin Web UI
      - '443:443' # Public HTTPS
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```

### ⚡ Setup Instructions
1.  **Start the container:** `docker-compose up -d`
2.  **Login:** Go to `http://<your-ip>:81`.
    *   **Default Email:** `admin@example.com`
    *   **Default Password:** `changeme`
3.  **Change Credentials:** Immediately update the email and password.

### 🔗 How to Proxy a Service (e.g., Gitea)
1.  Click **Proxy Hosts** -> **Add Proxy Host**.
2.  **Domain Names:** `git.home.lan` (Ensure this DNS record exists in Pi-Hole pointing to NPM's IP).
3.  **Scheme:** `http`
4.  **Forward Hostname:** `192.168.x.x` (IP of the Gitea container).
5.  **Forward Port:** `3000` (Internal port of Gitea).
6.  **Block Exploits:** Enable this for extra security.