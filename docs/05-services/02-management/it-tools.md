# Service: IT-Tools

## 🧐 What is it?
Collection of developer tools.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '3'
services:
  it-tools:
    image: corentinth/it-tools:latest
    ports:
      - "8080:80"
    restart: unless-stopped
```
*Access at `http://<your-ip>:8080`.*