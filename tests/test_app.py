from flask.testing import FlaskClient


class TestApp:
    def test_home(self, client: FlaskClient) -> None:
        response = client.get("/")

        assert response.text == "<h1>OIDC Server</h1>"

    def test_openid_configuration(self, client: FlaskClient) -> None:
        response = client.get("/.well-known/openid-configuration")

        assert response.json == {
            "authorization_endpoint": "http://localhost:5000/authorize",
            "token_endpoint": "http://localhost:5000/token",
            "userinfo_endpoint": "http://localhost:5000/userinfo",
            "jwks_uri": "http://localhost:5000/jwks_uri",
        }
