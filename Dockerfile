FROM python:3.7-slim

ARG PIP_EXTRA_URL

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt --extra-index-url $PIP_EXTRA_URL

RUN mkdir /app
COPY . /app

WORKDIR /app

CMD ["python", "main.py"]