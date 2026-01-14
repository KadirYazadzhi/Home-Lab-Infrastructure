# AI Stack: LLM Inference

## 🤖 Overview
This stack runs Large Language Models (LLMs) locally, ensuring total privacy. No prompts or data leave the home server. It serves as a private alternative to ChatGPT.

## 📦 Container Inventory

| Container Name | Image | Port | Role |
| :--- | :--- | :--- | :--- |
| `ollama` | `ollama/ollama` | 11434 | **Inference Engine:** Runs the actual models (e.g., Llama3, Mistral). Optimized for CPU inference (since no dedicated GPU is present). |
| `open-webui` | `ghcr.io/open-webui/open-webui` | 3000 | **Frontend:** A rich web interface (similar to ChatGPT) that connects to the Ollama API. |

## ⚙️ Performance & Hardware
*   **CPU Inference:** Since the cluster uses Intel Core i5-6500 CPUs (integrated graphics only), we rely on AVX2 instruction sets for inference.
*   **Model Selection:** We prioritize "Quantized" models (e.g., `q4_k_m`) to fit within the RAM constraints.
    *   *Node B (16GB RAM)* is the preferred host for this stack to allow running larger parameter models (e.g., 8B or 13B params).

## 🚀 Usage
To pull a new model via CLI:
```bash
docker exec -it ollama ollama run llama3
```
Then refresh Open-WebUI to see the new model available in the dropdown.
