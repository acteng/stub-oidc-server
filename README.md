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
