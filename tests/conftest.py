import pytest
from flask import Flask
from flask.testing import FlaskClient

from oidc_server.app import create_app


@pytest.fixture(name="app")
def app_fixture() -> Flask:
    return create_app({"TESTING": True, "SERVER_NAME": "localhost:5000"})


@pytest.fixture(name="client")
def client_fixture(app: Flask) -> FlaskClient:
    return app.test_client()
