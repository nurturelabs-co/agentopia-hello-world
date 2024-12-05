FROM python:3.10-slim-bullseye

WORKDIR /code

RUN apt-get update && apt-get install -y make
RUN apt-get install -y \
    gcc \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install poetry
# RUN curl -sSL https://install.python-poetry.org | python3 -

COPY ./requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt
RUN pip install websockets==10.2

# Install agentopia package
WORKDIR /code/agentopia
# COPY ./agentopia /code/agentopia
# RUN pip install -e .

WORKDIR /code

ARG PORT

COPY . /code/
EXPOSE 8890
# CMD uvicorn api:app --host 0.0.0.0 --port 
# CMD hypercorn api:app --bind [::]:$PORT
CMD ["make", "api"]
