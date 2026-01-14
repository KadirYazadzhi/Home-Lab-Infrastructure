# Service: Pi-Hole

### 🧐 What is it?
A DNS-based ad blocker. It intercepts DNS queries for known ad servers and returns an empty response (sinkholing).

### 💡 Why is it useful?
- **Network-wide Ad Blocking:** No browser extensions needed.
- **Privacy:** Blocks telemetry from Smart TVs and IoT devices.
- **Speed:** Reduces page load times by not downloading ad assets.

### ⚖️ Pros & Cons
*   **Pros:** Excellent web interface, very low resource usage, customizable blocklists.
*   **Cons:** Can break affiliate links, requires static IP for clients.

### 🛠️ Deployment Summary
- **Image:** `pihole/pihole:latest`
- **Port:** `53/udp`, `53/tcp`, `8089/tcp` (Admin UI)
