from agentopia import payable
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/hello_world")
@payable(
    hold_amount=10, hold_expires_in=3600
)  # Hold $0.000010 in the users account for 1hr
async def hello_world(
    request: Request,
):
    print("Executing hello_world endpoint")
    # Execute the service and charge the user $0.000_001
    print("Preparing response with $0.000001 charge")
    response = JSONResponse(
        content={"message": "Hello from Agentopia!"}, headers={"X-Usdc-Used": "1"}
    )
    print("Returning response")
    return response
