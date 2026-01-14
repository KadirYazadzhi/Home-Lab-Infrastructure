# Service: Uptime Kuma

## 🧐 What is it?
A monitoring dashboard. It pings your services (HTTP, TCP, Ping) and alerts you if they go down.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '3.8'
services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    container_name: uptime-kuma
    volumes:
      - ./uptime-kuma-data:/app/data
      - /var/run/docker.sock:/var/run/docker.sock # Optional: To monitor Docker containers directly
    ports:
      - "3001:3001"
    restart: always
```

### 🔧 Configuration
1.  Access at `http://<your-ip>:3001`.
2.  **Add Monitor:**
    *   **Monitor Type:** HTTP(s)
    *   **Friendly Name:** Gitea
    *   **URL:** `http://192.168.x.x:3000`
    *   **Heartbeat Interval:** 60 (Checks every minute).
3.  **Notifications:** Go to Settings -> Notifications. You can set up a Telegram bot to message you: "🔴 Gitea is DOWN".