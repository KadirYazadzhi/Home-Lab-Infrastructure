# Service: CPP-IDE

## 🧐 What is it?
Web-based C++ IDE.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '3'
services:
  cpp-ide:
    image: cpp-ide-cpp-ide:latest # Assuming custom or local image
    ports:
      - "8443:8443"
    restart: always
```
*Usually runs on HTTPS.*