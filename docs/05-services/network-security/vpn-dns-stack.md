# Network Security Stack: OpenVPN & Pi-Hole

## 🛡️ Overview
This stack represents the "Gateway" to the home infrastructure. Following the "Security by Obscurity" and "Zero Trust" principles, no application ports are exposed directly to the public internet. Access is exclusively granted via a secure VPN tunnel, which subsequently routes DNS queries through a local sinkhole for ad-blocking and privacy.

## 🏗️ Architecture Flow
1.  **Client** connects via UDP/1194 (The ONLY open port on the firewall).
2.  **OpenVPN** authenticates the client using certificates.
3.  **DNS Traffic** is routed internally to **Pi-Hole**.
4.  **Pi-Hole** resolves internal hostnames (e.g., `git.lan`, `jellyfin.lan`) and blocks ad/tracker domains.

## 📦 Container Inventory

| Container Name | Image | Port (Internal) | Port (Exposed) | Role |
| :--- | :--- | :--- | :--- | :--- |
| `openvpn` | `kylemanna/openvpn` | 1194/udp | 1194/udp | VPN Server & CA Authority |
| `pihole` | `pihole/pihole` | 53/tcp, 53/udp | - | DNS Sinkhole & DHCP Server |

## 🔧 Configuration Details
*   **Networking Mode:** Host networking is often preferred for VPNs, but here we use bridged mode with specific port forwarding to maintain isolation.
*   **Persistence:**
    *   `openvpn`: Stores `pki/` (Public Key Infrastructure) configurations.
    *   `pihole`: Stores `etc-pihole/` (Allow/Blocklists) and `etc-dnsmasq.d/` (Custom DNS records).

## 🚀 Usage
*   **Generating a new client:**
    ```bash
    # Access the running container to generate an .ovpn file
    docker exec -it openvpn easyrsa build-client-full MY_DEVICE nopass
    docker exec openvpn ovpn_getclient MY_DEVICE > MY_DEVICE.ovpn
    ```
