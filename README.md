# ComfyUI Dockerfile

This repository contains a Dockerfile to build a Docker container that runs **ComfyUI**.

### Includes:
- **ComfyUI WebUI**
- **StableDiffusion 1.5 Base Model**
- **ComfyUI-Manager**

## Prerequisites
Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-started/get-docker/)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

## Setup
1. Clone the repository:
    ```bash
    git clone https://github.com/TheCallipo/ComfyUI_Dockerfile.git
    ```

2. Navigate into the directory:
    ```bash
    cd ComfyUI_Dockerfile
    ```

3. Build the Docker image:
    ```bash
    docker build -t comfyui .
    ```

4. Run the Docker container:
    ```bash
    docker run --gpus all --name comfyui -d -p 8188:8188 comfyui
    ```

## Usage
To access the ComfyUI WebUI, open [localhost:8188](http://localhost:8188) in your browser.

## Management Commands
- **Enter Container Shell:**
    ```bash
    docker exec -it comfyui /bin/bash
    ```

- **Exit Container Shell:**
    ```bash
    exit
    ```

- **Stop Container:**
    ```bash
    docker stop comfyui
    ```

- **Start Container:**
    ```bash
    docker start comfyui
    ```

- **Restart Container:**
    ```bash
    docker restart comfyui
    ```

- **Copy Model from Host to Container:**
    ```bash
    docker cp <host-path> comfyui:/opt/ComfyUI/models/<model-type>
    ```
    Replace `<host-path>` with the local path of your model and `<model-type>` with the appropriate directory inside the container.

## Further Instructions
For more detailed usage instructions, refer to the following documentations:
[ComfyUI](https://docs.comfy.org)
[ComfyUI-Manager](https://github.com/ltdrdata/ComfyUI-Manager)
[Docker](https://docs.docker.com/)

