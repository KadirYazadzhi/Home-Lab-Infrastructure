# Development Lab: Judge0 & Gitea

## 1. Gitea (Source Control)
**Container:** `gitea` + `mysql-server-gitea`
*   **Description:** A lightweight, self-hosted Git service. It is the "Single Source of Truth" for this infrastructure repository.
*   **SSH Passthrough:** Port `222` is mapped to `22` inside the container to avoid conflict with the host's SSH daemon. Git clones are performed via: `git clone ssh://git@host:222/user/repo.git`.

## 2. Judge0 (Remote Code Execution)
**Containers:** `judge0/api`, `judge0-worker`, `redis`, `postgres`, `cpp-ide`
*   **Description:** An open-source online code execution system. It provides the backend for compiling and running untrusted code safely.
*   **Architecture:**
    1.  **API:** Receives source code + inputs.
    2.  **Redis:** Queues the submission.
    3.  **Worker:** Picks up the job, creates a sandboxed container, compiles, runs, and returns the stdout/stderr.
*   **Use Case:** Powering the `cpp-ide` container, allowing for a browser-based C++ coding environment similar to LeetCode.

## 3. Microsoft SQL Server
**Container:** `mcr.microsoft.com/mssql/server`
*   **Description:** Enterprise-grade SQL database used for .NET development and specific lab scenarios requiring T-SQL compatibility.