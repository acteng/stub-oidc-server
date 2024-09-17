bin = .venv/bin
packages = oidc_server tests

clean:
	find . -name __pycache__ -type d -prune -exec rm -rf {} \;

black-check:
	$(bin)/black --check $(packages)

isort-check:
	$(bin)/isort --check-only $(packages)

format-check: black-check isort-check

black:
	$(bin)/black $(packages)

isort:
	$(bin)/isort $(packages)

format: black isort

mypy:
	$(bin)/mypy $(packages)

ruff:
	$(bin)/ruff check $(packages)

lint: mypy ruff

ruff-fix:
	$(bin)/ruff check --fix $(packages)

fix: ruff-fix

test:
	$(bin)/pytest

verify: format-check lint test

run:
	FLASK_SERVER_NAME=localhost:5001 $(bin)/flask --debug --app oidc_server.app run --port 5001
