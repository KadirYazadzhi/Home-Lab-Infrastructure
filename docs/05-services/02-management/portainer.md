# Service: Portainer

## 🧐 What is it?
Portainer is the standard GUI for Docker. It allows you to inspect containers, view logs, and manage stacks without using the CLI.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '3'
services:
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    restart: always
    ports:
      - "8000:8000"
      - "9443:9443" # HTTPS Access
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # CRITICAL: Gives control over Docker
      - portainer_data:/data

volumes:
  portainer_data:
```

### ⚡ Quick Start
1.  Run `docker-compose up -d`.
2.  Navigate to `https://<your-ip>:9443`.
3.  **Initial Setup:** You will be asked to create an admin user.
4.  **Connect Environment:** Select "Get Started" with the local environment (the socket mounted above).

## ⚠️ Security Warning
Portainer has **root-level access** to your server via the Docker socket.
*   Never expose port `9443` to the public internet.
*   Use a long, complex password.