# Stub OIDC server

Stub OIDC server for testing.

## Prerequisites

1. Install Python 3.12

## Running locally

1. Create a virtual environment:

    ```bash
    python3.12 -m venv --prompt . --upgrade-deps .venv
    ```

1. Activate the virtual environment:

    ```bash
    source .venv/bin/activate
    ```

1. Install the dependencies:

    ```bash
    pip install -e .[dev]
    ```

1. Run the server:

    ```bash
    make run
    ```

1. Open http://localhost:5001

## Running locally using Docker

To run the server as a container:

1. Build the Docker image:

   ```bash
   docker build -t oidc_server .
   ```
   
1. Run the Docker image:

   ```bash
   docker run --rm -p 5001:5001 -e FLASK_SERVER_NAME=localhost:5001 oidc_server
   ```
   
1. Open http://localhost:5001/.well-known/openid-configuration

The server can also be run on a different port by specifying the `PORT` environment variable:

```bash
docker run --rm -p 8000:8000 -e FLASK_SERVER_NAME=localhost:8000 -e PORT=8000 oidc_server
```
