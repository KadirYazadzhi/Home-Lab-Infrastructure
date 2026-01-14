# Service: Pi-Hole

## 🧐 What is it?
Pi-Hole acts as a DNS sinkhole. It intercepts DNS requests from your devices. If a request matches a known ad server (e.g., `ads.google.com`), Pi-Hole returns `0.0.0.0`, effectively blocking the ad before it downloads.

## 🛠️ Installation & Deployment

### Docker Compose
```yaml
version: "3"
services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      # Port 80 is often taken by Nginx, so we map the UI to 8089
      - "8089:80"
    environment:
      - TZ=Europe/Sofia
      - WEBPASSWORD=admin  # Set your robust password here
    volumes:
      - ./etc-pihole:/etc/pihole
      - ./etc-dnsmasq.d:/etc/dnsmasq.d
    restart: unless-stopped
```

### ⚠️ Important Installation Notes
1.  **Port 53 Conflicts:** Ubuntu often runs `systemd-resolved` on port 53. You must disable it before running Pi-Hole:
    ```bash
    sudo systemctl disable systemd-resolved
    sudo systemctl stop systemd-resolved
    ```
    *Or configure systemd-resolved to bind to a different IP.*

2.  **Using with OpenVPN:**
    To force VPN clients to use Pi-Hole, edit your OpenVPN config (`openvpn-data/openvpn.conf`) and add:
    ```text
    push "dhcp-option DNS 10.8.0.1"
    ```
    *(Assuming 10.8.0.1 is your Pi-Hole/Gateway internal IP).*

## 🖱️ Usage
*   **Admin Panel:** Access at `http://<your-ip>:8089/admin`.
*   **Blocklists:** Go to Settings -> Adlists to add more regex filters.