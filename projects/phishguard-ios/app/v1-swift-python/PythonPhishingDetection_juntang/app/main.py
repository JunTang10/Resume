import logging
from fastapi import FastAPI
from app.api import asr, text, video

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"
)

logger = logging.getLogger(__name__)

app = FastAPI(title="Phishing Detection Backend")


@app.get("/")
def root():
    logger.info("Root endpoint was accessed")
    return {"message": "Backend is running"}


app.include_router(asr.router, prefix="/asr", tags=["ASR"])
app.include_router(text.router, prefix="/text", tags=["TEXT"])
app.include_router(video.router, prefix="/video", tags=["VIDEO"])

logger.info("FastAPI application configured successfully")