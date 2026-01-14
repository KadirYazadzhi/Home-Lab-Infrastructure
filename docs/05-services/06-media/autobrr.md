# Service: Autobrr

## 🧐 What is it?
The modern download automation tool. It monitors IRC announce channels to grab torrents instantly.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: "3"
services:
  autobrr:
    image: ghcr.io/autobrr/autobrr:latest
    container_name: autobrr
    environment:
      - TZ=Europe/Sofia
    volumes:
      - ./autobrr_config:/config
    ports:
      - "7474:7474"
    restart: unless-stopped
```

### ⚡ Configuration
1.  Go to `http://<your-ip>:7474`.
2.  **Create Account:** You will be prompted to create a user.
3.  **IRC Setup:** Add a network (e.g., `irc.abjects.net`) and your nick/pass.
4.  **Download Client:** Connect it to qBittorrent/Transmission via Settings -> Download Clients.