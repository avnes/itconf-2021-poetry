FROM python:3.13.0a6-slim

COPY . sandbox/

WORKDIR sandbox

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

RUN . $HOME/.poetry/env && make install

CMD . $HOME/.poetry/env && make run
