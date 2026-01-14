# Kasm Workspaces (VDI Infrastructure)

## 🖥️ What is Kasm?
Kasm Workspaces is a containerized streaming platform. It allows the creation of on-demand, ephemeral desktop environments (Virtual Desktop Infrastructure - VDI) inside the browser. It is used here to provide isolated browsing environments and secure remote workspaces.

## 🏗️ The Microservices Stack
Kasm is complex and runs as a distributed stack of containers:

| Container | Role |
| :--- | :--- |
| `kasm_proxy` | Nginx-based ingress controller for the Kasm UI. |
| `kasm_manager` | The "Brain." Orchestrates user sessions and spins up new containers. |
| `kasm_api` | REST API endpoint for the web interface. |
| `kasm_agent` | Runs on the compute nodes (Node A/B/D) to provision the actual desktop containers. |
| `kasm_share` | Facilitates file sharing between the host and the ephemeral sessions. |
| `kasm_guac` | Apache Guacamole gateway for rendering the desktop session to HTML5. |
| `kasm_db` | PostgreSQL database storing user profiles and configurations. |
| `kasm_redis` | Fast caching layer for session state management. |

## 🚀 Use Cases
1.  **Browser Isolation:** Opening suspicious links in a disposable Chrome container that is destroyed immediately after closing.
2.  **Remote Desktop:** Accessing a full Ubuntu Linux desktop GUI from an iPad or laptop via the browser.

## ⚙️ Hardware Considerations
*   **Resource Heavy:** Kasm requires significant RAM. The agents are best deployed on **Node B (16GB RAM)** to support multiple concurrent browser sessions.
