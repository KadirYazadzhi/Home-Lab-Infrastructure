# Home Media Stack

## 🎬 Overview
The Media Stack is the primary consumer of storage space in the cluster. It handles the acquisition, organization, and streaming of video content.

## 📦 Container Inventory

### 1. Jellyfin
*   **Container:** `jellyfin/jellyfin`
*   **Role:** The Media Server. Transcodes and streams movies/TV shows to clients (Smart TVs, Phones, Browsers).
*   **Hardware Affinity:** Strictly pinned to **Node C (HP EliteDesk G3)**.
    *   *Reason:* Node C contains the 1TB External HDD where the media libraries reside.
    *   *Transcoding:* Uses the Intel QuickSync (iGPU) on the i5-6500 for hardware-accelerated encoding/decoding, preserving CPU for other tasks.

### 2. Autobrr
*   **Container:** `ghcr.io/autobrr/autobrr`
*   **Role:** Automation tool to monitor IRC announce channels for new releases and trigger downloads automatically.
*   **Integration:** Communicates with download clients (like qBittorrent, not currently listed but assumed) and sends notifications via Discord/Telegram.

## 📂 Volume Mapping
For Jellyfin to work, the host paths must be mapped correctly:
```yaml
volumes:
  - /mnt/storage/media:/media  # The 1TB HDD mount
  - /docker/jellyfin/config:/config
```
