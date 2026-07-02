import logging
from fastapi import APIRouter, UploadFile, File, Form, HTTPException
from app.services.asr_service import ASRService

router = APIRouter()
logger = logging.getLogger(__name__)


@router.post("/upload")
async def upload_audio(
    file: UploadFile = File(...),
    language: str = Form("en"),
    request_id: str | None = Form(None)
):
    logger.info(
        "Received upload request | filename=%s | language=%s | request_id=%s",
        getattr(file, "filename", None),
        language,
        request_id
    )

    try:
        metadata, transcription = await ASRService.process_audio_file(
            upload_file=file,
            language=language,
            request_id=request_id
        )

        logger.info(
            "ASR processing finished | filename=%s | request_id=%s",
            metadata.file_name,
            metadata.request_id
        )

        analysis_input = ASRService.to_analysis_input(metadata, transcription)

        logger.info(
            "Analysis input created | file_name=%s | request_id=%s",
            analysis_input.file_name,
            analysis_input.request_id
        )

        return {
            "success": True,
            "message": "Audio uploaded and transcribed successfully",
            "metadata": metadata.model_dump(),
            "transcription": transcription.model_dump(),
            "analysis_input": analysis_input.model_dump()
        }

    except ValueError as e:
        logger.error("Validation error: %s", str(e))
        raise HTTPException(status_code=400, detail=str(e))

    except FileNotFoundError as e:
        logger.error("File not found error: %s", str(e))
        raise HTTPException(status_code=500, detail=str(e))

    except RuntimeError as e:
        logger.error("Runtime error: %s", str(e))
        raise HTTPException(status_code=500, detail=str(e))

    except Exception as e:
        logger.exception("Unexpected server error: %s", str(e))
        raise HTTPException(status_code=500, detail="Unexpected server error")