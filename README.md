# Stub OIDC server

Stub [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html) server for testing.

Primarily used to stub [GOV.UK One Login](https://docs.sign-in.service.gov.uk/) for end-to-end tests and load testing of
services that use it.

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

1. Open http://localhost:5001/.well-known/openid-configuration

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

The image is also available on GitHub Container registry as
[ghcr.io/acteng/stub-oidc-server](https://github.com/acteng/stub-oidc-server/pkgs/container/stub-oidc-server).

## Configuring

The server can be configured at runtime using a Web API.

### Web API

To create a user:

```bash
curl http://localhost:5001/users \
    -H 'Content-Type: application/json' \
    -d "{
            \"id\": \"test-user\",
            \"email\": \"test-user@example.com\"
        }"
```

To delete all users:

```bash
curl -X DELETE http://localhost:5001/users
```

To register an OIDC client:

```bash
curl http://localhost:5001/clients \
    -H 'Content-Type: application/json' \
    -d "{
            \"client_id\": \"test-client\",
            \"redirect_uri\": \"http://localhost:5000/auth\",
            \"public_key\": \"-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----\",
            \"scope\": \"openid email\"
        }"
```

To unregister all OIDC clients:

```bash
curl -X DELETE http://localhost:5001/clients
```

## Licence

[MIT License](LICENCE)
