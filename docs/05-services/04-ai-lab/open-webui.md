# Service: Open-WebUI

## 🧐 What is it?
A beautiful frontend for Ollama.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '3'
services:
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    container_name: open-webui
    ports:
      - "3000:8080" # Maps internal 8080 to host 3000
    environment:
      - OLLAMA_BASE_URL=http://ollama:11434 # Requires them to be on the same docker network
    volumes:
      - ./open-webui-data:/app/backend/data
    restart: always
```

### ⚡ Configuration
1.  Go to `http://<your-ip>:3000`.
2.  **Sign Up:** The first user created becomes the Admin.
3.  **Settings -> Models:** You should see the models you pulled in Ollama (e.g., `mistral:latest`). If not, check the `OLLAMA_BASE_URL` connection.