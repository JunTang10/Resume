import logging
from fastapi import APIRouter, UploadFile, File, Form, HTTPException, Request
from app.services.text_service import TextService

router = APIRouter()
logger = logging.getLogger(__name__)


@router.post("/upload")
async def upload_text_file(
    request: Request,
    file: UploadFile = File(...),
    source: str = Form("unknown"),
    language: str = Form("en"),
    request_id: str | None = Form(None)
):
    client_ip = request.client.host if request.client else None

    logger.info(
        "Received text file upload request | ip=%s | filename=%s | source=%s | language=%s | request_id=%s",
        client_ip,
        getattr(file, "filename", None),
        source,
        language,
        request_id
    )

    try:
        text_request, save_path, original_filename = await TextService.process_text_file(
            upload_file=file,
            source=source,
            language=language,
            request_id=request_id
        )

        analysis_input = TextService.to_analysis_input(
            text_request=text_request,
            file_name=original_filename
        )

        return {
            "success": True,
            "message": "Text file uploaded and processed successfully",
            "client_ip": client_ip,
            "file_name": original_filename,
            "file_path": save_path,
            "text_request": text_request.model_dump(),
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