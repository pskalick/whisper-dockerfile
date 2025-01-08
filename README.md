Documentation for GitHub Repository: Dockerfile for NVIDIA CUDA with Whisper Medium LLM

This repository provides a Dockerfile for setting up an environment with NVIDIA CUDA, Python 3, and the Whisper Medium Large Language Model (LLM) from OpenAI. It is designed to streamline the deployment of GPU-accelerated machine learning applications.
Dockerfile Overview

The provided Dockerfile is built using the official NVIDIA CUDA image with Ubuntu 22.04. It sets up the necessary environment for Python development and Whisper Medium LLM usage, including CUDA and GPU checks.
Dockerfile Breakdown
1. Base Image

FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

    Uses the official NVIDIA CUDA image as the base.
    Includes CUDA 11.8 with cuDNN 8 for GPU-accelerated computation.

2. Maintainer Information

LABEL maintainer="yourname@example.com"

    Adds a metadata label with maintainer details. Replace yourname@example.com with your email.

3. Update and Install Dependencies

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

    Updates the package list.
    Installs:
        Python 3 for development.
        pip for Python package management.
        python3-venv for virtual environments.
        ffmpeg, required for Whisper audio processing.
    Removes cached package lists to reduce image size.

4. Upgrade pip

RUN pip3 install --upgrade pip

    Ensures the latest version of pip is installed.

5. Install Whisper Medium LLM

RUN pip3 install git+https://github.com/openai/whisper.git

    Installs the Whisper model directly from the official GitHub repository.

6. Validate CUDA and GPU Setup

RUN nvcc -V && nvidia-smi

    Confirms CUDA installation and checks GPU availability:
        nvcc -V displays the CUDA compiler version.
        nvidia-smi provides the GPU status.

7. Set Default Command

CMD ["python3"]

    Sets the default command to Python 3.

Usage Instructions

    Clone the Repository

git clone https://github.com/<your-repo-name>.git
cd <your-repo-name>

Build the Docker Image

docker build -t whisper-cuda-env .

Run the Docker Container

docker run --gpus all -it whisper-cuda-env

    The --gpus all flag ensures the container has access to GPU resources.

Check GPU Status in Container

    Run the following commands inside the container:

    nvcc -V
    nvidia-smi

Run Python Applications

    Use the installed Python 3 environment to run your machine learning scripts:

        python3 your_script.py

Customization

    Change Python Version:
        Modify the apt-get install line to install a specific Python version.
    Add More Dependencies:
        Append additional packages to the apt-get install command or install Python libraries with pip3 install.
    Change Maintainer:
        Update the LABEL line with your email.

Prerequisites

    NVIDIA GPU: Ensure you have a GPU and the NVIDIA drivers installed.
    Docker: Install Docker Engine and configure it for GPU support using NVIDIA Container Toolkit.

Troubleshooting

    CUDA Errors:
        Verify CUDA installation with nvcc -V and ensure NVIDIA drivers are up to date.
    Whisper Installation Issues:
        Check the Whisper repository for any updates or dependencies.
    GPU Access Issues:
        Confirm the --gpus all flag is used and Docker is properly configured for GPU access.

References

    NVIDIA CUDA Docker Images
    OpenAI Whisper GitHub Repository
    Docker Documentation

This documentation should make it easy to understand and utilize the provided Dockerfile. For additional questions or issues, feel free to open an issue in the repository!
