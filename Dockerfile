FROM python:3.12-slim

ENV PORT=5001

WORKDIR /usr/src/app
COPY oidc_server ./oidc_server
COPY pyproject.toml .

RUN pip install --no-cache-dir . \
    && useradd oidc_server

USER oidc_server

CMD [ "sh", "-c", "gunicorn --bind 0.0.0.0:${PORT} --timeout 0 --forwarded-allow-ips='*' 'oidc_server.app:create_app()'" ]
