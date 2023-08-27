# File Info Web Server

This project is a REST API-based web server that accepts file uploads and provides information about the uploaded files. It's built using FastAPI, a modern web framework for building APIs with Python. The server also includes a simple UI for easy interaction.

## Table of Contents

- [File Info Web Server](#file-info-web-server)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)
    - [Uploading Files](#uploading-files)
    - [Accessing the UI](#accessing-the-ui)
  - [Dockerization](#dockerization)
    - [Building the Docker Image](#building-the-docker-image)
    - [Running the Docker Container](#running-the-docker-container)
  - [Kubernetes Deployment](#kubernetes-deployment)
  - [API Documentation](#api-documentation)
    - [GET `/`](#get-)
    - [POST `/upload/`](#post-upload)
  - [Shell Scripts](#shell-scripts)
  - [Thank you for reading this far!](#thank-you-for-reading-this-far)

## Getting Started

### Prerequisites

- Python 3.x
- Docker (for Dockerization)
- Kubernetes (for Kubernetes deployment)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/file-info-web-server.git
   cd file-info-web-server
   ```

2. Install the required Python packages:

   ```bash
   pip install -r requirements.txt
   ```

## Usage

### Uploading Files

You can upload files to the server using the `/upload/` endpoint. You can use tools like `curl` or API testing tools like Postman.

Example using `curl`:

```bash
curl -X POST -F "files=@path/to/your/file.txt" http://localhost:8000/upload/
```

### Accessing the UI

The server includes a simple UI that can be accessed by navigating to `http://localhost:8000/home` in your web browser.

## Dockerization

### Building the Docker Image

To build a Docker image of the project, execute the following command:

```bash
docker build -t file-info-web-server .
```

### Running the Docker Container

After building the Docker image, you can run a container using the following command:

```bash
docker run -p 8000:8000 file-info-web-server
```

## Kubernetes Deployment

You can deploy the web server on Kubernetes using the provided Kubernetes manifest files located in the `kubernetes/` directory.

```bash
kubectl apply -f kubernetes/
```

## API Documentation

### GET `/`

- **Description:** Endpoint to check if the server is running.
- **Response:**
  - HTTP Status Code: 200 OK
  - Response Body: `{"message": "Hello World"}`

### POST `/upload/`

- **Description:** Endpoint to upload files and get information about them.
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

## Shell Scripts

The following shell scripts are provided for convenience:

- `init.sh`: Bash script to start the server.
- `stop.sh`: Bash script to stop the server.





## Thank you for reading this far!
If you have any questions or suggestions, feel free to open an issue or contact me on [Twitter](https://twitter.com/gunwant11).

