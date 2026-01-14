# Service: OpenVPN

### 🧐 What is it?
OpenVPN is a high-security, open-source VPN protocol and software. It creates a secure, encrypted tunnel between your remote device and your home network.

### 💡 Why is it useful?
In this infrastructure, OpenVPN is the **sole entry point**. It allows you to access private services like Portainer or Gitea without exposing them to the internet via port forwarding.

### ⚖️ Pros & Cons
*   **Pros:** Extremely secure, supports MFA (Multi-Factor Authentication), works on any network.
*   **Cons:** Higher battery drain on mobile devices, slower than WireGuard, complex PKI (Public Key Infrastructure) management.

### 🛠️ Deployment Summary
Runs with `NET_ADMIN` privileges. 
- **Image:** `kylemanna/openvpn`
- **Port:** `1194/udp`
- **Volume:** `/etc/openvpn`
