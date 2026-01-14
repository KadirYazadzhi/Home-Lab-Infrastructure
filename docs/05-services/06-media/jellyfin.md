# Service: Jellyfin

## 🧐 What is it?
Your Media Server.

## 🛠️ Installation & Deployment

### Docker Compose
**Note:** This configuration assumes your 1TB HDD is mounted at `/mnt/hdd_1tb` on the host.

```yaml
version: '3.5'
services:
  jellyfin:
    image: jellyfin/jellyfin:latest
    container_name: jellyfin
    network_mode: 'host' # Crucial for DLNA and discovery
    volumes:
      - ./config:/config
      - ./cache:/cache
      - /mnt/hdd_1tb/media:/media # <--- MAP YOUR HARD DRIVE HERE
    restart: 'unless-stopped'
    # Optional: Hardware Transcoding (Intel QuickSync)
    devices:
      - /dev/dri/renderD128:/dev/dri/renderD128
      - /dev/dri/card0:/dev/dri/card0
```

### 🔧 Permissions Fix
If Jellyfin cannot see your files:
1.  Ensure the user running Docker has permissions to read `/mnt/hdd_1tb`.
2.  You might need to add `user: 1000:1000` to the compose file or `chmod -R 755 /mnt/hdd_1tb`.

### ⚡ Initial Setup
1.  Go to `http://<your-ip>:8096`.
2.  **Add Media Library:**
    *   **Content Type:** Movies
    *   **Folder:** Select `/media` (this corresponds to the volume map above).
3.  **Transcoding:** Go to Dashboard -> Playback. Select "Intel QuickSync" (QSV) if enabled.