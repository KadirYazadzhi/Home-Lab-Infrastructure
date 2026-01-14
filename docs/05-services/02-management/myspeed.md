# Service: MySpeed

## 🧐 What is it?
Speedtest tracker.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: '3'
services:
  myspeed:
    image: germannewsmaker/myspeed
    volumes:
      - ./myspeed_data:/myspeed/data
    ports:
      - "5216:5216"
    restart: unless-stopped
```
*Access at `http://<your-ip>:5216`.*