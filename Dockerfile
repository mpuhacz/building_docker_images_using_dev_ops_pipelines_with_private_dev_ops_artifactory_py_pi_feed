FROM python:3.7-slim

ARG PIP_EXTRA_URL

COPY requirements.txt /tmp/

RUN --mount=type=secret,id=PIP_EXTRA_URL \
    pip install -r /tmp/requirements.txt --extra-index-url $(cat /run/secrets/PIP_EXTRA_URL)

RUN mkdir /app
COPY . /app

WORKDIR /app

CMD ["python", "main.py"]
