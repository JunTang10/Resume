import logging
from fastapi import APIRouter, UploadFile, File, Form, HTTPException, Request
from app.services.video_service import VideoService

router = APIRouter()
logger = logging.getLogger(__name__)


@router.post("/upload")
async def upload_video(
    request: Request,
    file: UploadFile = File(...),
    language: str = Form("en"),
    request_id: str | None = Form(None)
):
    client_ip = request.client.host if request.client else None

    logger.info(
        "Received video upload request | ip=%s | filename=%s | language=%s | request_id=%s",
        client_ip,
        getattr(file, "filename", None),
        language,
        request_id
    )

    try:
        metadata, extraction_result = await VideoService.process_video_file(
            upload_file=file,
            language=language,
            request_id=request_id
        )

        analysis_input = VideoService.to_analysis_input(
            metadata=metadata,
            extraction_result=extraction_result,
            language=language
        )

        return {
            "success": True,
            "message": "Video uploaded and processed successfully",
            "client_ip": client_ip,
            "metadata": metadata.model_dump(),
            "extraction_result": extraction_result.model_dump(),
            "analysis_input": analysis_input.model_dump()
        }

    except ValueError as e:
        logger.error("Validation error: %s", str(e))
        raise HTTPException(status_code=400, detail=str(e))

    except FileNotFoundError as e:
        logger.error("File error: %s", str(e))
        raise HTTPException(status_code=500, detail=str(e))

    except RuntimeError as e:
        logger.error("Runtime error: %s", str(e))
        raise HTTPException(status_code=500, detail=str(e))

    except Exception as e:
        logger.exception("Unexpected server error: %s", str(e))
        raise HTTPException(status_code=500, detail="Unexpected server error")