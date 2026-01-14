# Productivity & Knowledge Management

## 🎯 Purpose
This stack hosts the "Digital Brain" of the infrastructure—personal files, documents, and the knowledge base.

## 📦 Container Inventory

### 1. Nextcloud (Private Cloud)
*   **App:** `nextcloud` (Apache)
*   **Database:** `mariadb:10.6` (`nextcloud-db-1`)
*   **Function:** Replaces Google Drive/Dropbox. Handles file synchronization across devices.
*   **Storage:** Mounts a volume from **Node C (HDD)** for mass storage.

### 2. Obsidian LiveSync
*   **Container:** `ghcr.io/linuxserver/obsidian` (or CouchDB helper)
*   **Function:** Serves as the self-hosted backend for Obsidian.md. Allows real-time synchronization of markdown notes between phone and desktop without using a third-party cloud.

### 3. Gotenberg
*   **Container:** `gotenberg/gotenberg`
*   **Function:** A stateless API for converting PDF files. Used by other services (like Stirling-PDF or custom scripts) to generate reports or convert HTML to PDF.

## 💾 Backup Strategy
*   **Database Dumps:** A cron job runs nightly to dump `mariadb` and `postgres` (Obsidian) data to a backup location.
*   **Volume Snapshots:** The underlying filesystem on Node C is snapshotted to prevent data loss from accidental deletion.
