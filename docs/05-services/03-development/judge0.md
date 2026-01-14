# Service: Judge0

### 🧐 What is it?
An online code execution system. It takes source code, runs it in a sandbox, and returns the output.

### 💡 Why is it useful?
Allows you to build your own competitive programming platform or run C++ code remotely through the `cpp-ide`.

### 📦 Components
1. **API:** Entry point for code submissions.
2. **Worker:** The actual sandboxed environment.
3. **Redis & Postgres:** Backend for queueing and results.

### ⚖️ Pros & Cons
*   **Pros:** High security (sandboxed), supports 50+ languages.
*   **Cons:** High CPU usage during compilation.
