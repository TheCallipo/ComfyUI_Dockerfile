# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    COMFYUI_REPO=https://github.com/comfyanonymous/ComfyUI.git \
    COMFYUI_MANAGER_REPO=https://github.com/ltdrdata/ComfyUI-Manager.git \
    COMFYUI_DIR=/opt/ComfyUI \
    BASE_MODEL_URL=https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libgl1-mesa-glx \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Clone the ComfyUI repository
RUN git clone $COMFYUI_REPO $COMFYUI_DIR

# Change into ComfyUI directory
WORKDIR $COMFYUI_DIR

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124 && \
    pip install -r requirements.txt

#Install Base Model
RUN wget -c $BASE_MODEL_URL -P ./models/checkpoints/

# Clone the ComfyUI-Manager repository
RUN cd custom_nodes && git clone $COMFYUI_MANAGER_REPO

# Expose the port the ComfyUI runs on
EXPOSE 8188

# Command to run ComfyUI and listen to 0.0.0.0:8188
CMD ["python", "main.py", "--listen", "0.0.0.0", "--port", "8188"]
