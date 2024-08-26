# Use the official NVIDIA CUDA image with Ubuntu as a base
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Set the maintainer label
LABEL maintainer="yourname@example.com"

# Update the package list and install Python 3, pip, and other dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip3 install --upgrade pip

# Install Whisper Medium LLM
RUN pip3 install git+https://github.com/openai/whisper.git

# Run nvcc and nvidia-smi to check CUDA installation and GPU status
RUN nvcc -V && nvidia-smi

# Set the default command to Python 3
CMD ["python3"]
