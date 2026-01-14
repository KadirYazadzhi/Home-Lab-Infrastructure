# Hardware Analysis: HP ProDesk/EliteDesk Cluster

This document analyzes the specific strengths and weaknesses of the hardware powering this cluster (HP G2/G3 Mini/SFF nodes).

---

## 1. The Architecture: Skylake (Gen 6)
All nodes run **Intel Core i5-6500**.
*   **Cores/Threads:** 4 Cores / 4 Threads. No Hyper-threading.
*   **Virtualization:** Supports VT-x and VT-d (Direct I/O). This is excellent for KVM/Proxmox but `docker` uses the kernel directly so VT-d matters less here.
*   **AES-NI:** Supported. Critical for **OpenVPN** encryption speed. Without this, your VPN would cap at 20Mbps.

## 2. Weak Points (The Bottlenecks)

### ⚠️ Proprietary Power Supplies (PSU)
*   **Problem:** HP uses proprietary 12V connectors, not standard ATX 24-pin.
*   **Risk:** If a PSU dies, you cannot buy a generic replacement from a PC shop. You must source a used HP part.
*   **Mitigation:** Keep one spare power brick/unit if possible.

### ⚠️ NVMe Support (G2 vs G3)
*   **Node C (G3):** Has native NVMe M.2 support. Fast booting and database access.
*   **Node A/B (G2):** The G2 generation's M.2 slot is often SATA-only or requires BIOS hacks to boot from NVMe.
*   **Impact:** This is why Node C is the "Storage Node". It has the superior I/O throughput.

### ⚠️ Lack of ECC RAM
*   **Problem:** These consumer CPUs do not support Error Correcting Code (ECC) RAM.
*   **Risk:** "Bit flips" (cosmic rays changing a 0 to a 1 in RAM) can corrupt data.
*   **Real World:** For a media server (Jellyfin), it doesn't matter (a pixel glitches). For **ZFS Storage** or **Financial Databases**, it is risky.
*   **Verdict:** Do not run a mission-critical Bank database on Node B.

## 3. Structural/Thermal Constraints

### 🌡️ Airflow & Stacking
*   **Design:** These units are designed to suck air from the front and exhaust out the back.
*   **The Mistake:** Stacking them directly on top of each other without spacers transfers heat from CPU A to Drive B.
*   **Solution:** Use 3D printed spacers or rubber feet to leave 2cm gap between stacked nodes.

### 🔌 C-States & Power Consumption
*   **Advantage:** The i5-6500 has excellent idle power states (C-States).
*   **Tweak:** In BIOS, enable "Deep Sleep" / "C-States".
*   **Result:** A node can idle at ~10-15W. The whole 4-node cluster likely pulls less power than a single old gaming PC (60-80W total).

## 4. Why this Hardware Rocks (Pros)
1.  **Price-to-Performance:** You can buy these for $50-$80. Raspberry Pi 4 kits cost $100+ and are 5x slower.
2.  **x86 Compatibility:** Unlike ARM (Raspberry Pi), every Docker container works flawlessly. No "exec format error".
3.  **Repairability:** You can open them without tools. RAM and SSDs are standard.
