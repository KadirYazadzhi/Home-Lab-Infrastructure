# 🛠 Inventory & Provisioning

This directory manages the "Iron" - the physical servers.

## Structure
*   **[ansible/](ansible/):** Automation playbooks.
    *   `hosts.ini`: Mapping IPs to Node Roles.
    *   `site.yml`: The main setup script.
    *   `roles/`: Reusable logic (common setups, storage mounting).
*   **nodes.md:** Detailed inventory list (MAC addresses, Serial Numbers).
