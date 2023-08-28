# File Info Web Server

This project is a REST API-based web server that accepts file uploads and provides information about the uploaded files. It's built using FastAPI, a web framework for building APIs with Python. The server also includes a simple UI for easy interaction. The server is containerized using Docker and can be deployed on Kubernetes. CI/CD is implemented using GitHub Actions.

Docker image is available at [DockerHub](https://hub.docker.com/repository/docker/gunwant11/rf-uploader/)
Kubernetes deployment is available at [Azure](http://20.219.169.21:8000/home)

## Getting Started

### Prerequisites

Before you start, ensure you have the following tools installed:

- Docker: For containerization
- Minikube: For local Kubernetes deployment
- GitHub : For CI/CD

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

   - Builds a Docker image named `rf-file-upload` based on the provided Dockerfile.
   - Runs a new Docker container with port 8000 mapped and a volume linking the host directory to the container's `/app` directory.
   - If any previous containers are running, they are stopped and removed.
   - Outputs "running on port 8000".

   The server is now accessible at `http://localhost:8000`. To stop the server, use the following command:

   ```bash
   chmod +x stop.sh
   ./stop.sh
   ```

3. **Access the Web UI:**

   The web UI is available at `http://localhost:8000/home`.
   You can upload files using the form and view information about the uploaded files.

## API Documentation

### GET `/`

- **Description:** Endpoint to check the server status.
- **Response:**
  - HTTP Status Code: 200 OK
  - Response Body: `{"message": "API is running"}`

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

## Docker Specification

The Docker image is based on the official Python 3.9 image. The following steps are performed during the build process:

1. Install the required Python packages using `pip`.
2. Copy the source code to the `/app` directory.
3. Expose port 8000.
4. Set the working directory to `/app`.
5. Run the server using `uvicorn`.

Manual commands:

```bash
docker build -t <image name > .
docker run -p 8000:8000 -v $(pwd):/app <image name>
```

## Kubernetes Deployment

For Kubernetes deployment, the following files are provided:

- `kubernetes/deployment.yaml`: Deployment manifest which creates a deployment with 1 replica and latest image tag.
- `kubernetes/service.yaml`: Service manifest which creates a service of type LoadBalancer to expose the deployment.
- `kubernetes/ingress.yaml`: Ingress manifest which creates an ingress to route traffic to the service.

1. Start Minikube:

   ```bash
   minikube start
   ```

2. Apply the Kubernetes manifest files:

   ```bash
   kubectl apply -f kubernetes/
   ```
3. Expose the service:

   ```bash
    minikube service  rf-service
    ```
This will open the service in the default browser.
By default, the service is exposed on port 8000. You can access the service at `http://<minikube ip>/home`.

## GitHub Actions

### Build and Publish Workflow

The `build-and-publish` GitHub Actions workflow included to build and publish the Docker image to DockerHub.
- ### Trigger
  The workflow is triggered code is pushed to the `master` branch or pull request is created against the `master` branch.
  Workflow can be triggered manually by clicking on the `Actions` tab and selecting the `build-and-publish` workflow.

- ### Steps
- Checkout the repository
- Build the Docker image
- Login to DockerHub
- Push the image to DockerHub
- Logout from DockerHub

## Environment Variables

The following environment variables are used in the project:
- DOCKERHUB_USERNAME: DockerHub username
- DOCKERHUB_TOKEN: DockerHub access token
  
  ### Flowchart
  ![flowchart]('./static/images/flowchart.png')

## Bonus
<!-- created an action delpoy.ymal to deploy our image wiht tag latest to aks cluster and   -->
Created a workflow to deploy the image to AKS cluster. 

- ### Trigger
  Workflow can be triggered manually by clicking on the `Actions` tab and selecting the `deploy` workflow.

- ### Steps
- Checkout the repository
- Login to Azure
- Set the AKS context
- Deploy the image to AKS cluster
- Logout from Azure
  
  ## Environment Variables
  The following environment variables are used in the project:  
  - AZURE_CREDENTIALS: Azure credentials
   
   use the following command to get the credentials
   ```bash
    az ad sp create-for-rbac --name <name> --scopes <scope/rg> --role contributor --sdk-auth
    ```

  ## Accessing the cluster
  ```bash
  az account set --subscription <subscription id>
  az aks get-credentials --resource-group <resource group> --name <cluster name>
  ```
You can use `kubectl` to access the cluster now.


## Thank you for reading this far!

If you have any questions or suggestions, feel free to open an issue or contact me on [Twitter](https://twitter.com/gunwant11). Your feedback is appreciated!