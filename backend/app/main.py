from __future__ import annotations

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

from .config import settings
from .firebase import init_firebase
from .routers import (
    ai,
    auth,
    consultations,
    devices,
    lookups,
    notifications,
    support,
    training,
    verification,
)
from .utils.responses import error_response, success_response
from .utils.firebase_logger import setup_firebase_logging

app = FastAPI(title="SILAH Backend", version="0.1.0")

allowed = [origin.strip() for origin in settings.allowed_origins.split(",") if origin.strip()]
if allowed:
    app.add_middleware(
        CORSMiddleware,
        allow_origins=allowed,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )


@app.on_event("startup")
def on_startup() -> None:
    setup_firebase_logging()
    init_firebase()


@app.exception_handler(HTTPException)
async def http_exception_handler(_request, exc: HTTPException):
    return JSONResponse(
        status_code=exc.status_code,
        content=error_response(str(exc.detail), code=0),
    )


@app.exception_handler(Exception)
async def unhandled_exception_handler(_request, _exc: Exception):
    return JSONResponse(
        status_code=500,
        content=error_response("Internal server error", code=0),
    )


@app.get("/health")
def health() -> dict:
    return success_response({"status": "ok"})


app.include_router(ai.router)
app.include_router(auth.router)
app.include_router(devices.router)
app.include_router(lookups.router)
app.include_router(verification.router)
app.include_router(consultations.router)
app.include_router(training.router)
app.include_router(support.router)
app.include_router(notifications.router)
