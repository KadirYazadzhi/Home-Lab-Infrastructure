# Service: Ollama

## 🧐 What is it?
The backend for running AI models.

## 🛠️ Installation & Deployment

### Docker Compose (CPU Only)
Since your nodes are i5-6500 (no dedicated GPU), we use the standard image.

```yaml
version: '3'
services:
  ollama:
    image: ollama/ollama
    container_name: ollama
    ports:
      - "11434:11434"
    volumes:
      - ./ollama_models:/root/.ollama
    restart: always
    tty: true
```

### 📥 Managing Models
Once the container is running, you need to download models inside it.
1.  **Enter the container:**
    ```bash
    docker exec -it ollama bash
    ```
2.  **Pull a model (e.g., Mistral):**
    ```bash
    ollama run mistral
    ```
    *Note: On an i5-6500, expect slow performance (approx 2-4 tokens/sec).*

3.  **List installed models:**
    ```bash
    ollama list
    ```