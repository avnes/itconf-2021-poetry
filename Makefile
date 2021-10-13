.PHONY: run install dev mypy pylint flake8 bandit lint test check

PACKAGE_DIR:=itconf_2021_poetry

run:
	poetry run python main.py

install:
	poetry install --no-dev

dev:
	poetry install && poetry run pre-commit install

flake8:
	poetry run flake8 $(PACKAGE_DIR) tests main.py

mypy:
	poetry run mypy $(PACKAGE_DIR) tests main.py

pylint:
	poetry run pylint $(PACKAGE_DIR) tests main.py

bandit:
	poetry run bandit -r $(PACKAGE_DIR) main.py

lint:
	$(MAKE) flake8
	$(MAKE) pylint
	$(MAKE) mypy
	$(MAKE) bandit

test:
	poetry run pytest

check:
	poetry run pre-commit run --all-files
