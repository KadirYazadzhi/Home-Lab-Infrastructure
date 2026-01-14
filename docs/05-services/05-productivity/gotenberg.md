# Service: Gotenberg

## 🧐 What is it?
A stateless API for converting files to PDF.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: "3"
services:
  gotenberg:
    image: gotenberg/gotenberg:8
    ports:
      - "3000:3000"
    # Command arguments to customize behavior (e.g., timeout)
    command:
      - "gotenberg"
      - "--api-port=3000"
      - "--log-level=info"
```

### ⚡ Usage Example
To convert a URL to PDF using `curl`:
```bash
curl \
--request POST 'http://localhost:3000/forms/chromium/convert/url' \
--form 'url=https://google.com' \
-o google.pdf
```