# Service: Judge0

## 🧐 What is it?
A system for executing untrusted code securely.

## 🛠️ Installation & Deployment

Judge0 is complex and requires multiple containers.

### Docker Compose
```yaml
version: '3'

services:
  server:
    image: judge0/api:1.13.1
    volumes:
      - ./judge0.conf:/judge0.conf:ro
    ports:
      - "2358:2358"
    environment:
      - REDIS_URL=redis://redis:6379
      - POSTGRES_URL=postgres://judge0:judge0@db:5432/judge0
    depends_on:
      - db
      - redis

  workers:
    image: judge0/api:1.13.1
    command: ["./scripts/workers"]
    environment:
      - REDIS_URL=redis://redis:6379
      - POSTGRES_URL=postgres://judge0:judge0@db:5432/judge0
    privileged: true # Required for Docker-in-Docker sandboxing

  db:
    image: postgres:13.0
    environment:
      - POSTGRES_USER=judge0
      - POSTGRES_PASSWORD=judge0
      - POSTGRES_DB=judge0
    volumes:
      - postgres-data:/var/lib/postgresql/data

  redis:
    image: redis:6.0
    command: [
      "bash", "-c",
      "docker-entrypoint.sh --appendonly yes --requirepass \"\""
    ]
    volumes:
      - redis-data:/data

volumes:
  postgres-data:
  redis-data:
```

### ⚡ Usage
Send a POST request to execute code:
```bash
curl -X POST "http://localhost:2358/submissions?base64_encoded=false&wait=true" \
    -H "Content-Type: application/json" \
    -d 
'{'
    "source_code": "#include <stdio.h>\nint main(void) { printf(\"Hello Judge0!\"); return 0; }",
    "language_id": 50
}'
```