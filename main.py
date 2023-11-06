# -*- coding: utf-8 -*-

# import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

# imports for the API
from models.RestfulModel import *
from routers import ocr
from utils.ImageHelper import *

# initializing the application
app = FastAPI(title="API do Paddle OCR",
              description="API de OCR - Paddle OCR e FastAPI")

# CORS settings
origins = [
    "*"
]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

# including the OCR router in the application
app.include_router(ocr.router)

# uvicorn.run(app=app, host="0.0.0.0", port=9006)
