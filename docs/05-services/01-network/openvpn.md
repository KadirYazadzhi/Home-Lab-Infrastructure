# Service: OpenVPN

## 🧐 What is it?
OpenVPN is a full-featured SSL VPN. In this setup, it acts as the **Gateway** to your home network. By connecting to this container, you gain access to all other internal services (like Gitea or Jellyfin) that are not exposed to the public internet.

## 🛠️ Installation & Deployment

### Prerequisite: Docker Network
Ensure you have a bridge network (e.g., `proxynet`) if you plan to connect it to other containers easily, though OpenVPN often runs standalone or with host networking.

### Docker Compose
```yaml
version: '3'
services:
  openvpn:
    image: kylemanna/openvpn
    container_name: openvpn
    cap_add:
      - NET_ADMIN
    ports:
      - "1194:1194/udp"
    restart: always
    volumes:
      - ./openvpn-data:/etc/openvpn
```

### ⚡ First Time Setup (Crucial Steps)
You cannot just "up" the container. You must generate the certificates first.

1.  **Initialize Config:**
    Replace `VPN.YOURDOMAIN.COM` with your public IP or Dynamic DNS hostname.
    ```bash
    docker run -v $(pwd)/openvpn-data:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://VPN.YOURDOMAIN.COM
    ```

2.  **Init PKI (Public Key Infrastructure):**
    You will be asked for a passphrase. Remember it!
    ```bash
    docker run -v $(pwd)/openvpn-data:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
    ```

3.  **Start the Service:**
    ```bash
    docker-compose up -d
    ```

4.  **Generate Client Certificate (for your phone/laptop):**
    ```bash
    docker exec -it openvpn easyrsa build-client-full MY_PHONE nopass
    docker exec openvpn ovpn_getclient MY_PHONE > MY_PHONE.ovpn
    ```
    *Now import `MY_PHONE.ovpn` into your OpenVPN Connect app.*

## ⚙️ Configuration Notes
*   **Split Tunneling:** By default, this might route ALL your traffic through home. If you only want to access home apps, check `ovpn_genconfig -n` options.