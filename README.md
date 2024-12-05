# Hello World Service for Agentopia.xyz Marketplace

This is an example service that demonstrates how to build and sell a simple API service on Agentopia Marketplace.

## Overview

This service implements a basic "Hello World" endpoint that:

- Holds $0.1 USDC from the user's account for 1 hour
- Returns a simple greeting message
- Charges $0.000001 USDC per request

## Setup

1. Install dependencies:

```bash
python -m venv env
source env/bin/activate
pip install -r requirements.txt
```

2. Run the service:

```bash
make dev
```

3. Run the service in Test mode:

```bash
export AGENTOPIA_LOCAL_MODEL=True # This will ignore payment requirements
make dev
```

4. Test the service:

```bash
curl http://localhost:8890/hello_world
```
