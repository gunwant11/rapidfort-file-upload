# File Info Web Server

This project is a REST API-based web server that accepts file uploads and provides information about the uploaded files. It's built using FastAPI, a modern web framework for building APIs with Python. The server also includes a simple UI for easy interaction.
## Table of Contents

- [File Info Web Server](#file-info-web-server)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [API Documentation](#api-documentation)
    - [GET `/`](#get-)
    - [POST `/upload/`](#post-upload)
  - [Kubernetes Deployment](#kubernetes-deployment)
  - [GitHub Actions](#github-actions)
    - [Build and Publish Workflow](#build-and-publish-workflow)
  - [Bonus](#bonus)
  - [Thank you for reading this far!](#thank-you-for-reading-this-far)

## Getting Started

### Prerequisites

Before you start, ensure you have the following tools installed:

- Docker: For containerization
- Minikube: For local Kubernetes deployment

## Usage

Follow these steps to quickly set up and run the server:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/file-info-web-server.git
   cd file-info-web-server
   ```

2. **Run the Initialization Script:**

   ```bash
   chmod +x init.sh
   ./init.sh
   ```

   This script performs the following actions:

   - Stops and removes any existing container named `rf-upload`.
   - Builds a Docker image named `rf-file-upload` based on the provided Dockerfile.
   - Runs a new Docker container with port 8000 mapped and a volume linking the host directory to the container's `/app` directory.
   - Outputs "running on port 8000".

   The server is now accessible at `http://localhost:8000`. To stop the server, use the following command:

   ```bash
   chmod +x stop.sh
   ./stop.sh
   ```

3. **Access the Web UI:**

   The web UI is available at `http://localhost:8000/home`.

## API Documentation

### GET `/`

- **Description:** Endpoint to check the server status.
- **Response:**
  - HTTP Status Code: 200 OK
  - Response Body: `{"message": "Hello World"}`

### POST `/upload/`

- **Description:** Endpoint to upload files and retrieve their information.
- **Request:**
  - Method: POST
  - Headers: `Content-Type: multipart/form-data`
  - Body: Form data with the uploaded file(s)
- **Response:**
  - HTTP Status Code: 200 OK
  - Response Body: JSON containing information about uploaded file(s), e.g.:
    ```json
    {
      "files": [
        {
          "filename": "file.txt",
          "mime_type": "text/plain",
          "size": 1234,
          "extension": "txt"
        }
      ]
    }
    ```

## Kubernetes Deployment

To deploy the web server on Kubernetes using Minikube, follow these steps:

1. Start Minikube:

   ```bash
   minikube start
   ```

2. Apply the Kubernetes manifest files:

   ```bash
   kubectl apply -f kubernetes/
   ```

   The web server will be accessible using the Minikube IP and port.

## GitHub Actions

### Build and Publish Workflow

The `build-and-publish` GitHub Actions workflow builds the Docker image and publishes it to DockerHub with tags `latest` and a new version tag. You can trigger this workflow by pushing to the repository or manually from the Actions tab.

## Bonus
<!-- created an action delpoy.ymal to deploy our image wiht tag latest to aks cluster and   -->
Created a workflow to deploy the image to AKS cluster. The workflow is triggered when a new image is pushed to DockerHub. The workflow uses the [Azure/k8s-deploy] action to deploy the image to AKS. The workflow is defined in the file `.github/workflows/deploy.yml`.


## Thank you for reading this far!

If you have any questions or suggestions, feel free to open an issue or contact me on [Twitter](https://twitter.com/gunwant11). Your feedback is appreciated!