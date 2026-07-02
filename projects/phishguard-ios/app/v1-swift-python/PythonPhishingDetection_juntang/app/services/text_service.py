import os
import logging
from typing import Optional, Tuple

from app.schemas.text import TextRequest
from app.schemas.analysis import AnalysisInput
from app.utils.file_utils import save_upload_file

logger = logging.getLogger(__name__)

ALLOWED_TEXT_EXTENSIONS = {".txt"}


class TextService:
    @staticmethod
    def is_allowed_text_file(filename: str) -> bool:
        if not filename:
            return False
        _, ext = os.path.splitext(filename)
        return ext.lower() in ALLOWED_TEXT_EXTENSIONS

    @staticmethod
    async def process_text_file(
        upload_file,
        source: str = "unknown",
        language: str = "en",
        request_id: Optional[str] = None
    ) -> Tuple[TextRequest, str, str]:
        logger.info(
            "Starting text file processing | filename=%s | source=%s | language=%s | request_id=%s",
            getattr(upload_file, "filename", None),
            source,
            language,
            request_id
        )

        if upload_file is None:
            logger.error("No uploaded file received")
            raise ValueError("No uploaded file received")

        if not upload_file.filename:
            logger.error("Uploaded file must have a filename")
            raise ValueError("Uploaded file must have a filename")

        if not TextService.is_allowed_text_file(upload_file.filename):
            logger.error("Unsupported text file type: %s", upload_file.filename)
            raise ValueError("Only .txt files are supported")

        save_path = await save_upload_file(upload_file, "uploads/text")

        logger.info("Text file saved successfully: %s", save_path)

        if not os.path.exists(save_path):
            logger.error("Saved text file does not exist: %s", save_path)
            raise FileNotFoundError("Saved text file does not exist")

        try:
            with open(save_path, "r", encoding="utf-8") as f:
                content = f.read()
        except UnicodeDecodeError:
            logger.exception("Failed to decode text file with utf-8")
            raise ValueError("Text file must be UTF-8 encoded")
        except Exception as e:
            logger.exception("Failed to read text file")
            raise RuntimeError(f"Failed to read text file: {str(e)}") from e

        cleaned_text = content.strip()

        if not cleaned_text:
            logger.error("Uploaded text file is empty")
            raise ValueError("Uploaded text file is empty")

        text_request = TextRequest(
            text=cleaned_text,
            source=source,
            language=language,
            request_id=request_id
        )

        logger.info(
            "Text file processed successfully | filename=%s | length=%s | request_id=%s",
            upload_file.filename,
            len(cleaned_text),
            request_id
        )

        return text_request, save_path, upload_file.filename

    @staticmethod
    def to_analysis_input(
        text_request: TextRequest,
        file_name: Optional[str] = None
    ) -> AnalysisInput:
        analysis_input = AnalysisInput(
            text=text_request.text,
            source=text_request.source,
            language=text_request.language,
            request_id=text_request.request_id,
            file_name=file_name
        )

        logger.info(
            "Analysis input created from text file successfully | request_id=%s | file_name=%s",
            text_request.request_id,
            file_name
        )

        return analysis_input