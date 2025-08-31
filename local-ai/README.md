
docker run --gpus all nvidia/cuda:11.5.2-base-ubuntu20.04 nvidia-smi

# Local-AI Setup Guide

This guide will help you set up the `local-ai` environment for running AI models locally with GPU acceleration. Follow each step carefully. **All commands are unchanged from the original instructions.**

---

## 1. Clone Only the `local-ai` Directory

To save bandwidth and disk space, you can clone only the `local-ai` directory from this repository using Git's sparse checkout feature:

```bash
git clone --depth 1 --filter=blob:none --sparse https://github.com/andrew153d/HomeLab.git
cd HomeLab
git sparse-checkout set local-ai
```

---

## 2. Set Up NVIDIA Container Toolkit

If you have an NVIDIA GPU and want to use it with Docker containers, follow these steps to install the NVIDIA Container Toolkit. This enables GPU passthrough for Docker.

> **Note:** You may need `sudo` privileges for these commands. The system will reboot at the end of this step.

```sh
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo ubuntu-drivers autoinstall
sudo nvidia-ctk runtime configure --runtime=docker
sudo reboot now
```

---

### 2.6. Test NVIDIA Docker Setup

After your system reboots, verify that your NVIDIA drivers and Docker GPU integration are working:

```sh
nvidia-smi
docker run --gpus all nvidia/cuda:11.5.2-base-ubuntu20.04 nvidia-smi
```

If both commands show your GPU information, the setup was successful.

---

## 3. Additional Resources

- [Ollama Docker Example](https://github.com/mythrantic/ollama-docker): Example repository for running Ollama in Docker.
- [Step-by-Step Guide: Setting up Ollama Models with Docker Compose](https://collabnix.com/setting-up-ollama-models-with-docker-compose-a-step-by-step-guide/): Detailed walkthrough for using Docker Compose with Ollama models.
