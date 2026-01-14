# The Physical Layer: Cabling & Network Gear

This document covers Layer 1 (Physical) and Layer 2 (Data Link) of the Home Lab. Understanding this is crucial because no amount of Docker optimization can fix a bad cable.

---

## 1. Cabling Standards: The Reality

Marketing often lies. Here is the engineering truth for home labs.

| Cable Type | Speed | Max Distance | Bandwidth | Use Case | Verdict |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Cat5e** | 1 Gbps (up to 2.5G) | 100m | 100 MHz | Standard home wiring. | **Keep it.** If it's in your walls, it's fine for 1Gbps. |
| **Cat6** | 10 Gbps | 55m | 250 MHz | New deployments. | **The Standard.** Flexible, affordable, supports 10G short runs. |
| **Cat6a** | 10 Gbps | 100m | 500 MHz | Enterprise runs. | **Overkill** for patch cables, good for in-wall future-proofing. |
| **Cat7/8** | 40 Gbps | 30m | 1000+ MHz | Data Centers. | **AVOID.** Often fake on Amazon. Requires grounding (shielded). Stiff and hard to work with. |

### ⚠️ Common Mistakes
*   **CCA (Copper Clad Aluminum):** Cheap cables use aluminum cores coated in copper. They are brittle, have higher resistance, and can cause POE (Power over Ethernet) fires. **Always buy Pure Copper.**
*   **Flat Cables:** They lack twisted pair separation, leading to crosstalk and interference. Use round cables for reliability.

---

## 2. Network Gear Hierarchy

### ❌ The Hub (Obsolete)
*   **How it works:** "Dumb" repeater. When packet comes in Port 1, it blasts it out to Ports 2-8.
*   **Why NOT:** Creates "Collision Domains". Only one device can talk at a time. Security nightmare (everyone sees everyone's traffic).
*   **Verdict:** Throw it away.

### ✅ The Switch (Layer 2)
*   **How it works:** Learns MAC addresses. Sends traffic ONLY to the destination port.
*   **Unmanaged:** Plug & Play. Good for connecting nodes.
*   **Managed (L2+):** Supports VLANs (Virtual LANs). Critical if you want to isolate your IoT devices from your Server Cluster.
*   **Verdict:** Use a Gigabit Unmanaged Switch for your 4 nodes.

### 🧠 The Router (Layer 3)
*   **How it works:** Connects different networks (e.g., Your LAN <-> The Internet). Handles NAT and DHCP.
*   **Home Router limitations:** Most ISP routers crumble under 1000+ connections (torrents).
*   **Verdict:** Your OpenVPN setup bypasses many router limitations by creating a virtual tunnel.

### 🔥 The Firewall
*   **Role:** Blocks traffic based on rules.
*   **Hardware vs Software:** You are using `ufw` (Software Firewall) on Linux. A dedicated hardware firewall (like pfsense/OPNsense) is better but requires a dedicated PC with 2 NICs.

---

## 3. Speed & Duplex
*   **Auto-Negotiation:** Devices "talk" to agree on speed (10/100/1000).
*   **The "Bad Cable" Symptom:** If your 1Gbps link drops to 100Mbps, 99% of the time, **one of the 8 wires in the cable is broken**. Gigabit requires all 8 wires; 100Mbps only needs 4.
